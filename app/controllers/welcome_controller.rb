class WelcomeController < ApplicationController
  def index
    page = params[:page] || 1
    per = params[:per] || 30
    @emoji = Kaminari.paginate_array(all_emoji).page(page).per(per)
  end

  private

  def all_emoji
    @all_emoji ||= Emoji.get_emoji(current_token, params[:q])
  end
end
