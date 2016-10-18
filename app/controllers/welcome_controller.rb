require 'httparty'

class WelcomeController < ApplicationController
  def index
    @emoji = Emoji.get_emoji['emoji']
  end
end
