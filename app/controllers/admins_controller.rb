class AdminsController < ApplicationController
  before_action :authenticate_admin!

  check_authorization
  
  layout "admins"

  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)
  end

end