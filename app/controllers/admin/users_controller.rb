class Admin::UsersController < AdminsController
  before_action :set_user, only: [:show, :feature]

  authorize_resource
  
  def index
    @users = User.all
  end

  def show
  end

  # PUT /admins/collections/:id/feature
  def feature
    if @user.toggle_featured
      render json: { success: true }
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end