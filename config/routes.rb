Rails.application.routes.draw do
  namespace :users do
    namespace :v1, defaults: { format: :json } do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'users/v1/auth/registrations'
      }
    end
  end
  namespace :admins do
    namespace :v1, defaults: { format: :json } do
      mount_devise_token_auth_for 'Admin', at: 'auth', controllers: {
        registrations: 'admins/v1/auth/registrations'
      }
      # Only admins can Add/remove products and modify their prices
      # So we are gonna use only create, update and destroy actions
      resources :products, only: [:create, :update, :destroy]
    end
  end
end
