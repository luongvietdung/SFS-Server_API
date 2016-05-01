class ShippersController < ApplicationController
  before_action :shipper, only: [:update, :show]

  def create
    @shipper = Shipper.new shipper_params
    if @shipper.save
    else
    end
  end

  def update
    if @shipper.update shipper_update_params
    else
    end
  end

  def show
  end

  private
  def shipper_params
    params.require(:shipper).permit Shipper::SHIPPER_PARAMS
      .merge(user_attributes: User::USER_PARAMS)
  end

  def shipper_update_params
    params.require(:shipper).permit Shipper::SHIPPER_PARAMS
  end

  def shipper
    @shipper = Shipper.find params[:id]
  end
end
