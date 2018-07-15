class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :user_params, if: :devise_controller?

  protected

  def user_params
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_path, alert: "You must be an admin to do that."
    end
  end
end
