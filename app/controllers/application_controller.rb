class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # Change login path
  def after_sign_in_path_for(resource)
    if customer_signed_in?
      customers_path(resource)
    else
      admin_top_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
