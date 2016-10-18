module Api
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def import
      # fallback to account email if slack_username is nil
      UsersImportJob.perform_later(current_user.slack_domain,
                                   current_user.slack_username || current_user.email,
                                   params[:password],
                                   params[:emoji].permit!.to_h)
      render json: {}
    end

  end
end