class ApplicationController < ActionController::Base
  include Slack::Token

  protect_from_forgery with: :exception

  before_action :set_token

  private

  def set_token
    @token = current_token
  end
end
