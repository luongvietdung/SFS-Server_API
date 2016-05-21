class Api::DetailOrdersController < ApiController
  before_action :authozine
  before_action :user

  def index
    render json: @user.detail_orders, each_serializer: DetailOrderSerializer
  end

  def new
    render json: {code: DetailOrder.generate_code(user)}
  end

  def create
    if (@order = @user.detail_orders.build(order_params))
      render json: @order, serializer: DetailOrderSerializer
    else
      render_create_fail "Order"
    end
  end

  private
  def order_params
    params.require(:detail_order).permit DetailOrder::PARAMS_CREATABLE
  end

  def authozine
    render_access_denied unless current_user.accountable_type == "Shop" && current_user == user
  end

  def user
    @user = User.find params[:user_id]
  end
end
