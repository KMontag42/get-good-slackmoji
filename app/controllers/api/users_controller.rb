module Api
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def import
      username = current_user.slack_username.blank? ?
          current_user.email :
          current_user.slack_username

      # fallback to account email if slack_username is nil
      UsersImportJob.perform_later(current_user.slack_domain,
                                   username,
                                   params[:password],
                                   params[:emoji].permit!.to_h)
      render json: {}
    end

  end
end