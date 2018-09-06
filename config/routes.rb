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
    end
  end
end
