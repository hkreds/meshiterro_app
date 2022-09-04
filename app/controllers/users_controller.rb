class UsersController < ApplicationController
  before_action :ensure_current_user, {only: [:edit, :update]}

  def ensure_current_user
    if current_user.id != params[:id].to_i
      redirect_to users_path
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
