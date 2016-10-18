class UsersImportJob < ApplicationJob
  queue_as :default

  def perform(user, image_url)
    # this is where we do the code from the JS lib
  end
end
