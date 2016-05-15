class Api::UsersController < ApiController
  def index
    @users = User.online
    render json: @users, each_serializer: UserAccountableSerializer
  end

  before_action :user, only: [:show, :update, :destroy]
  before_action :updatable, only: [:update, :destroy]

  def update
    if @user.update user_params
      render json: @user, serializer: UserSerializer
    else
      render_update_fail User.name
    end
  end

  def show
    render json: @user, serializer: UserAccountableSerializer
  end

  def destroy
    @user.destroy
    render json: {success: true}
  end

  private
  def updatable
    render_access_denied unless current_user == user
  end

  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def user
    @user = User.find params[:id]
  end
end
