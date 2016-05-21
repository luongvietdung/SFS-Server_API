Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth',
    skip: [:omniauth_callbacks, :confirms, :registers, :recovers, :token_validations],
    controllers: {sessions: 'sessions'}
  root "api/users#index"
  namespace :api do
    resources :users, only: [:update, :show, :index, :destroy] do
      resources :detail_orders, only: [:index, :create, :new]
    end
    resources :shippers, expect: [:new, :edit]
    resources :shops, expect: [:new, :edit]
    resources :order_validations, only: [:create]
  end

end
