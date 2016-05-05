class ShippersController < ApplicationController
  before_action :shipper, only: [:update, :show]

  def create
    @shipper = Shipper.new shipper_params
    if @shipper.save
      render json: @shipper
    else
    end
  end

  def update
    if @shipper.update shipper_update_params
      render json: @shipper
    else
    end
  end

  def show
    render json: @shipper
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
end
