class LocationsController < ApplicationController
  before_action :user, expect: :index

  def index
    type = params[:type] || Shipper.name
    @locations = Location.locations type
  end

  def create
    @location = @user.build_location location_params
    if @location.save
    else
    end
  end

  def update
    if @user.location.update location_params
    else
    end
  end

  private
  def location_params
    params.require(:location).permit Location::LOCATION_PARAMS
  end

  def user
    @user = User.find params[:user_id]
  end
end
