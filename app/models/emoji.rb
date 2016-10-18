require 'httparty'

class Emoji
  include HTTParty
  base_uri 'https://slack.com/api'

  def self.get_emoji
    get('/emoji.list?pretty=1&token='+ENV['SLACK_TOKEN'])
  end
end
