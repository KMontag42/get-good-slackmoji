Rails.application.routes.draw do
  root 'welcome#index'

  scope 'slack_token', controller: :slack_token do
    get '', action: :index, as: :slack_token
    get 'edit', as: :slack_token_edit
    post 'save', as: :slack_token_save
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
