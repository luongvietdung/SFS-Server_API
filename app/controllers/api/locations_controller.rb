class Api::LocationsController < ApiController
  before_action :user, only: [:create]
  before_action :updatable, only: [:create, :update]
  before_action :location, only: [:show]

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
      render_create_fail Location.name
    end
  end

  def update
    if @location.update location_params
      render json: @user.location
    else
      render_update_fail Location.name
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

  def updatable
    render_access_denied unless current_user == user
  end
end
