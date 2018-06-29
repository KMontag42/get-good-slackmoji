class SlackTokenController < ApplicationController
  def index; end

  def edit; end

  def save
    set_session_token(params[:token])

    redirect_to :slack_token
  end
end
