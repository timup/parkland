class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_params, only: [:create, :update]

  protected
    def after_update_path_for(resource)
      user_path(resource)
    end

  private
    def configure_permitted_params
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:name, :image, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:name, :image, :headline, :email, :password, :password_confirmation, :current_password)
      end
    end
end
