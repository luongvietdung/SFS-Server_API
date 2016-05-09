class Api::UsersController < ApiController
  # def index
  #   type = params[:type] || Shipper.name
  #   @users = User.by_accountable_type(type).includes :location, :accountable
  #   render json: @users
  # end

  before_action :updatable, only: [:update]
  before_action :user, only: [:show]

  def update
    if @user.update user_params
      redirect_to api_users_path(@user)
    else
      render_update_fail User.name
    end
  end

  def show
    render json: @user, serializer: UserAccountableSerializer
  end

  private
  def updatable
    render_access_denied unless current_user == @user
  end

  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def user
    @user = User.find params[:id]
  end
end
