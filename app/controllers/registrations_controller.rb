class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_params, only: [:create, :update]
  
  skip_authorization_check

  private
  def configure_permitted_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end
end