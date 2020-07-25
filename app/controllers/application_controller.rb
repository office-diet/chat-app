class ApplicationController < ActionController::Base
  before_action :move_to_signin, only: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def move_to_signin
    unless authenticate_user!
      redirect_to new_user_registration_path
    end
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
