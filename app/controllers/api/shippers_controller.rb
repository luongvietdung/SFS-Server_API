class Api::ShippersController < ApiController
  skip_before_action :authenticate_user!, only: [:create]

  before_action :shipper, only: [:show]
  before_action :updatable, only: [:update]

  def index
    @shippers = Shipper.all.includes :user
    render json: @shippers, each_serializer: FullShipperSerializer
  end

  def create
    @shipper = Shipper.new shipper_params
    if @shipper.save
      render json: @shipper, serializer: FullShipperSerializer
    else
      render_create_fail Shipper.name
    end
  end

  def update
    if @shipper.update shipper_update_params
      render json: @shipper, serializer: FullShipperSerializer
    else
      render_update_fail Shipper.name
    end
  end

  def show
    render json: @shipper, serializer: FullShipperSerializer
  end

  private
  def shipper_params
    params.require(:shipper).permit Shipper::SHIPPER_PARAMS,
      user_attributes: User::USER_PARAMS
  end

  def shipper_update_params
    params.require(:shipper).permit Shipper::SHIPPER_PARAMS
  end

  def shipper
    @shipper = Shipper.find params[:id]
  end

  def updatable
    render_access_denied unless current_user == shipper.try(:user)
  end
end
