class LocationsController < ApplicationController
  before_action :user, only: [:create]
  before_action :location, only: [:update]

  def index
    type = params[:type] || Shipper.name
    @locations = Location.locations type
    render json: @locations
  end

  def create
    @location = @user.build_location location_params
    if @location.save
      render json: @location
    else
    end
  end

  def update
    if @user.location.update location_params
      render json: @user.location
    else
    end
  end

  def show
    render json: @location
  end

  private
  def location_params
    params.require(:location).permit Location::LOCATION_PARAMS
  end

  def location
    @location = Location.find params[:id]
  end

  def user
    @user = User.find params[:user_id]
  end
end
