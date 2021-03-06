class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Change login path
  def after_sign_in_path_for(resource)
    if customer_signed_in?
      flash[:success] = "ログインしました"
      root_path
    else
      admin_root_path
    end
  end

  # Change loggout path
  def after_sign_out_path_for(resource)
    if resource == :customer
      flash[:success] = "ログアウトしました"
      root_path
    else
      new_admin_session_path
    end
  end

  protected
  # New registration save function
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
