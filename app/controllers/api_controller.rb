class ApiController < ApplicationController
  before_action :authenticate_user!

  protected
  def render_create_fail model_name
    render json: {errors: [I18n.t("create_fail", model: model_name)]},
      status: 422
  end

  def render_update_fail model_name
    render json: {errors: [I18n.t("update_fail", model: model_name,
      name: current_user.accountable.name)]}, status: 400
  end

  def render_access_denied
    render json: {errors: [I18n.t("access_denied")]}, status: 403
  end
end
