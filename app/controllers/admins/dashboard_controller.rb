class Admins::DashboardController < AdminsController
  
  def index
    authorize! :view, :dashboard
  end
end