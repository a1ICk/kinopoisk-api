class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: %i[show destroy]

  def index
    authorize User
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    authorize @user
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
