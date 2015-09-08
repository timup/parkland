class Admin::DashboardController < AdminController
  
  def index
    authorize! :view, :dashboard
  end
end