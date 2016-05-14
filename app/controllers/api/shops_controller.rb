class Api::ShopsController < ApiController
  skip_before_action :authenticate_user!, only: [:create]

  before_action :shop, only: [:show]
  before_action :updatable, only: [:update]

  def index
    @shops = Shop.online
    render json: @shops, each_serializer: FullShopSerializer
  end

  def create
    @shop = Shop.new shop_params
    if @shop.save
      render json: @shop, serializer: FullShopSerializer
    else
      render_create_fail Shop.name
    end
  end

  def update
    if @shop.update(shop_update_params) && @shop.user.update(user_params)
      render json: @shop.shop_response
    else
      render_update_fail Shop.name
    end
  end

  def show
    render json: @shop, serializer: FullShopSerializer
  end

  private
  def shop_params
    params.require(:shop).permit Shop::SHOP_PARAMS,
      user_attributes: User::USER_PARAMS
  end

  def shop_update_params
    params.require(:shop).permit Shop::SHOP_PARAMS
  end

  def shop
    @shop = Shop.find params[:id]
  end

  def updatable
    render_access_denied unless current_user == shop.try(:user)
  end

  def user_params
    params.require(:shop).permit User::USER_AUTO_UPDATE_PARAMS
  end
end
