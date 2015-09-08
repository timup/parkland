class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_params, only: [:create, :update]

  private
  def configure_permitted_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end
end