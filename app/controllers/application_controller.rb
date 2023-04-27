class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?
  #adminとしてログインしていなければ管理者ログイン画面に
  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end

  protected

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
    # devise_parameter_sanitizer.permit(:sign_in, keys:[:name])
    # 8行目はuser.rbで記述してある事と同義だが念の為記述しておいても良い
  end

  # def configre_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_in, keys:[:name])
  # end
end
