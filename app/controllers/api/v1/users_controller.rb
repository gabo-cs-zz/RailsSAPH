class Api::V1::UsersController < ApiController

  before_action :set_user, only: %i[show update destroy]
  wrap_parameters :user, include: %i[role_vp gender_vp cc name address email password password_confirmation phone_number date_of_birth ]

  def index
    @users = User.all
  end

  def genders
    genders = User.gender_vps
    render json: { message: 'Genders loaded', data: genders }, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: 'Inserted, two-timed', data: @user }, status: :ok
    else
      render json: { message: 'User not inserted', data: @user.errors }, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    if @user.update(user_params)
      render json: {data: @user}, status: :ok
    else
      render json: { message: 'User not updated', data: @user.errors }, status: :unprocessable_entity
    end
  end

  # soft delete pending
  def destroy
    if @user.destroy
      render json: {data: @user}, status: :ok
    else
      render json: { message: 'User not deleted', data: @user.errors }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit!
  end

  def set_user
    @user = User.find(params[:id])
  end

end
