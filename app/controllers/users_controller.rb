class UsersController < ApplicationController
  before_action :require_current_user, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    logger.info @user
  end

  private
  def user_params
    params.required(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_current_user
    user = User.find(params[:id])
    unless current_user?(user)
      redirect_to root_path
    end
  end
end
