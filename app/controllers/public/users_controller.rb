class Public::UsersController < ApplicationController
  def new
  end

  def show
    @user = current_user
    @posts = @user.posts
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to public_user_path(user.id)
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image_url, :email)
  end
end
