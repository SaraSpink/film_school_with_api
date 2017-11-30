class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?




  def authorize
    if !current_user
      flash[:alert] = "Please sign in to visit this page."
      redirect_to '/'
    end
  end

  def authorize_admin

    if current_user.admin === true
      new_location_path
    else
      flash[:alert] = "Only an admin can visit this page."
      redirect_to '/'
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth) }
  end
end
