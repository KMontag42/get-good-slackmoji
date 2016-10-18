module Api
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def import
      UsersImportJob.perform_later(current_user.slack_domain,
                                   current_user.slack_username,
                                   params[:password],
                                   params[:emoji].permit!.to_h)
      render json: {}
    end

  end
end