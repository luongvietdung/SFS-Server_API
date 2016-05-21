class Api::OrderValidationsController < ApiController
  def create
    @order = DetailOrder.find_by param_validation
    if @order && @order.update(status: true)
      render json: {message: "Success"}
    else
      render json: {message: "Fail"}, status: 403
    end
  end

  private
  def param_validation
    params.require(:validation).permit :phone_shop, :code, :code_checking
  end
end
