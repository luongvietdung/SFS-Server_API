class UsersController < ApplicationController
  def index
    type = params[:type] || Shipper.name
    @users = User.by_accountable_type(type).includes :location, :accountable
    render json: @users
  end
end
