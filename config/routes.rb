Rails.application.routes.draw do
  resouces :users, only: [:index] do
    resouces :locations, only: [:create, :update]
  end

  resouces :locations, only: :index

  resouces :shippers, only: [:create, :update, :show]
  resouces :shops, only: [:create, :update, :show]
end
