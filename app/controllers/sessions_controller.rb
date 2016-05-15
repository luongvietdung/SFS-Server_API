class SessionsController < DeviseTokenAuth::SessionsController
  def create
    super do
      @resource.update status: true
    end
  end

  def destroy
    @resource.update status: false
    super
  end

  protected
  def render_create_success
    render json: @resource.token_validation_response
  end
end
