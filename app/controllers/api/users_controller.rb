module Api
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def import
      u = current_user
      # don't for get params[:image_url]
      UsersImportJob.perform_later u, params[:image_url]
    end

  end
end