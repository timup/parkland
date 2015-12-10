class Admin::DashboardController < AdminsController
  
  def index
    authorize! :view, :dashboard
  end
end