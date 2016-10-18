require 'slack'

class UsersImportJob < ApplicationJob
  queue_as :default

  def perform(domain, email, password, emoji)
    # emoji looks like { emoji_name: URL }
    Slack.new.upload_emoji domain, email, password, emoji
  end
end
