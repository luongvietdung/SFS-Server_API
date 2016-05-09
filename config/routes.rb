Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth',
    skip: [:omniauth_callbacks, :confirms, :registers, :recovers, :token_validations],
    controllers: {sessions: 'sessions'}
  root "api/users#index"
  namespace :api do
    resources :users, only: [:update, :show] do
      resources :locations, only: [:create, :update]
    end
    resources :shippers, expect: [:new, :edit]
    resources :shops, expect: [:new, :edit]
    resources :locations, only: [:index]
  end

end
