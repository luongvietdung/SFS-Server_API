Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth',
    skip: [:omniauth_callbacks, :confirm_callbacks, :register_callbacks, :recover_callbacks]
  namespace :api do
    resources :users do
      resources :locations, only: [:create, :update]
    end
    resources :shippers, only: [:create, :update, :show]
    resources :shops, only: [:create, :update, :show]
    resources :locations, only: [:index]
  end

end
