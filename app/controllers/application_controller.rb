class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Serialization

  rescue_from(ActionController::RoutingError) {
    render json: {errors: [I18n.t("not_found")]}, status: 404
  }
  rescue_from(Exception) {
    render :json => {errors: [I18n.t("errors")]}, status: 500
  }
end
