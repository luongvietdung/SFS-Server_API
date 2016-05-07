class Api::ShopsController < ApiController
  skip_before_action :authenticate_user!, only: [:create]

  before_action :shop, only: [:update, :show]

  def create
    @shop = Shop.new shop_params
    if @shop.save
      render json: @shop
    else
    end
  end

  def update
    if @shop.update shop_update_params
      render json: @shop
    else
    end
  end

  def show
    render json: @shop
  end

  private
  def shop_params
    params.require(:shop).permit Shop::SHOP_PARAMS, user_attributes: User::USER_PARAMS
  end

  def shop_update_params
    params.require(:shop).permit Shipper::SHIPPER_PARAMS
  end

  def shop
    @shop = Shop.find params[:id]
  end
end
