class AdminsController < ApplicationController
  before_action :authenticate_admin!

  check_authorization
  
  layout "admin"

  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)
  end

end