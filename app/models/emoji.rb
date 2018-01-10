require 'httparty'

class Emoji
  include HTTParty
  base_uri 'https://slack.com/api'

  def self.get_emoji(query = false)
    response = get('/emoji.list?pretty=1&token='+ENV['SLACK_TOKEN'])
    emoji = response['emoji']
    emoji.select! { |_, val| val.include? query } if query
    emoji.to_a.reverse # this lets us paginate
  end
end
