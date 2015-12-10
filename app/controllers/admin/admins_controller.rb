class Admin::AdminsController < AdminsController
	authorize_resource
  
  def index
  	@admin = Admin.new
    @admins = Admin.all
  end
end