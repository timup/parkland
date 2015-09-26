class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  check_authorization unless: :devise_controller?

  before_action :setup_new_form, if: :user_signed_in?

  layout :layout_by_resource

  private
    def setup_new_form
      @new_resource = Resource.new
      @new_collection = Collection.new
    end

    def layout_by_resource
      if devise_controller? && resource_name == :admin
        "admin"
      else
        "application"
    end
  end

end
