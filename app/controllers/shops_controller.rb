class ShopsController < ApplicationController
  before_action :shop, only: [:update, :show]

  def create
    @shop = Shop.new shipper_params
    if @shop.save
    else
    end
  end

  def update
    if @shop.update shipper_update_params
    else
    end
  end

  def show
  end

  private
  def shop_params
    params.require(:shop).permit Shop::SHOP_PARAMS
      .merge(user_attributes: User::USER_PARAMS)
  end

  def shop_update_params
    params.require(:shop).permit Shipper::SHIPPER_PARAMS
  end

  def shop
    @shop = Shop.find params[:id]
  end
end
