# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  def after_sign_in_path_for(resource)
    public_user_path(resource)
  end
  # before_action :configure_sign_in_params, only: [:create]

  #ゲストログインする為のアクション
  def guest_sign_in
    user = User.guest #userモデルで定義したメソッド
    sign_in user
    redirect_to public_user_path(user.id)
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def user_state
    @user = User.find_by(name: params[:user][:name])
    return if !@user
    if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
      redirect_to new_user_registration_path
    else
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
