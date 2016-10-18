Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, :controllers => { :registrations => "user/registrations" }

  namespace :api do
    post 'import', to: 'users#import'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
