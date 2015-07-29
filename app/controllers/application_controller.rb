class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  check_authorization

  before_action :new_resource

  private

  def new_resource
    @new_resource = Resource.new
  end
end
