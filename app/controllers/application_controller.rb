class ApplicationController < ActionController::Base
  helper_method :auth_user
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:registration) { |u| u.permit(:name, :email, :password, :role)}
    devise_parameter_sanitizer.permit(:edit_user_registration_path) {|u| u.permit(:name, :email, :password, :current_password, :phone_number, :address, :card, :expiry, :cvv, :role)}
  end

end
