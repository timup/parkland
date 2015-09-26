class AdminsController < ApplicationController
  before_action :authenticate_admin!
  
  layout "admins"

  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)
  end

end