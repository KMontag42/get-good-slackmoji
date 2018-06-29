require 'httparty'

class WelcomeController < ApplicationController
  include Slack::Token

  def index
    page = params[:page] || 1
    per = params[:per] || 30
    @emoji = Kaminari.paginate_array(emoji).page(page).per(per)
  end

  private

  def emoji
    @all_emoji ||= Emoji.get_emoji(current_token, params[:q])
  end
end
