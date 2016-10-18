require 'httparty'

class WelcomeController < ApplicationController
  def index
    if signed_in?
      @emoji = Emoji.get_emoji['emoji']
    else
      flash[:alert] = 'You need to sign in'
      redirect_to new_user_session_path
    end
  end
end
