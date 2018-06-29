class SlackTokenController < ApplicationController
  include Slack::Token

  before_action :set_token

  def index; end

  def edit; end

  def save
    set_session_token(params[:token])

    redirect_to :slack_token
  end

  private

  def set_token
    @token = current_token
  end
end
