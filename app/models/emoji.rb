require 'httparty'

class Emoji
  include HTTParty
  include Slack::Token

  base_uri 'https://slack.com/api'

  def self.get_emoji(token, query = false)
    new.get_emoji(token, query)
  end

  def get_emoji(token, query = false)
    response = self.class.get('/emoji.list?pretty=1&token=' + token)
    emoji = response['emoji']

    return [] if emoji.nil?

    emoji.select! { |_, val| val.include? query } if query
    emoji.to_a.reverse # this lets us paginate
  end
end
