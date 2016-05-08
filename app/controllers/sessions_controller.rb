class SessionsController < DeviseTokenAuth::SessionsController

  def create
    super do
      @resource.update status: true
    end
  end

  def destroy
    super do
      @resource.update status: false
    end
  end

  protected
  def render_create_success
    render json: @resource.token_validation_response
  end
end
