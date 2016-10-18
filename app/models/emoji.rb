require 'httparty'

class Emoji
  include HTTParty
  base_uri 'https://slack.com/api'

  def self.get_emoji
    get('/emoji.list?token=xoxp-15339600372-15344814513-82242859588-0094603eba9a37cc80f218b8c16e1243&pretty=1')
  end
end