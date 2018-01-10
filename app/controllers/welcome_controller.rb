require 'httparty'

class WelcomeController < ApplicationController
  def index
    page = params[:page] || 1
    per = params[:per] || 30
    @emoji = Kaminari.paginate_array(Emoji.get_emoji(params[:q])).page(page).per(per)
  end
end
