class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :user_activity
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:full_name])
  end


  private

  def user_activity
    current_user.try :touch
  end
end
