Rails.application.routes.draw do
  resources :users do
    resources :locations, only: [:create, :update]
  end
  resources :shippers
  resources :shops
  resources :locations, only: [:index]
end
