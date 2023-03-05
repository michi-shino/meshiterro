class ApplicationController < ActionController::Base
 before_action :authenticate_user!, except: [:top, :about] # top, about の2つのアクションのみログインしなくてアクセス可能にする
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 追加ここから
  def after_sign_in_path_for(resource)
    user_path(current_user) # ログインした直後は、ユーザーの詳細ページに遷移
  end
  # 追加ここまで

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
  end
end
