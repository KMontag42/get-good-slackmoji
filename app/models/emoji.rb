require 'httparty'

class Emoji
  include HTTParty
  include Slack::Token

  base_uri 'https://slack.com/api'

  def self.get_emoji(token, query = false)
    cache_key = "#{token}"

    cache_key += "/#{query}" if query

    return [] if cache_key.blank?

    Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      Rails.logger.debug('cache key not hit')
      new.get_emoji(token, query)
    end
  end

  def get_emoji(token, query = false)
    response = self.class.get('/emoji.list?pretty=1&token=' + token)
    emoji = response['emoji']

    return [] if emoji.nil?

    emoji.select! { |_, val| val.include? query } if query
    emoji.to_a.reverse # this lets us paginate
  end
end
