require "json"

Capybara.current_driver = :webkit
Capybara::Webkit.configure do |config|
  config.allow_unknown_urls
end

class Slack
  def upload_emoji(domain, email, password, emoji_hash)
    session = Capybara::Session.new(:webkit)

    puts "Importing #{emoji_hash.count} emoji"
    Dir.mkdir("emoji_images") unless Dir.exist?("emoji_images")
    Dir.chdir("emoji_images") do
      emoji_hash.each do |text, url|
        next if url.start_with?("alias:")
        image_extension = File.extname(URI.parse(url).path)
        filename = "#{text}#{image_extension}"
        next if File.exist?(filename)
        puts "Downloading emoji for '#{text}'"
        `curl -s '#{url}' -o '#{filename}'`
      end
    end

    puts "Going to sign in"
    session.visit("http://#{domain}.slack.com/customize/emoji")
    session.fill_in("email", with: email)
    session.fill_in("password", with: password)
    session.click_button("Sign in")

    emoji_hash.each do |text, url|
      puts "doing upload"
      session.fill_in("name", with: text)
      puts "after fill in"
      if url.start_with?("alias:")
        target = url.split(":")[1]
        puts "Aliasing :#{text}: to :#{target}:"
        session.click_link('set alias for existing emoji')
        session.check('modealias')
        session.select(target, :from => "alias")
      else
        puts "Importing :#{text}:"
        session.choose('modedata')
        image_extension = File.extname(URI.parse(url).path)
        filename = "#{text}#{image_extension}"
        session.attach_file("emojiimg", File.absolute_path("./emoji_images/#{filename}"))
      end

      session.click_link_or_button 'Save New Emoji'
    end
  end
end