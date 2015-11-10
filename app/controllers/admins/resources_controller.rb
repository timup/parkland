class Admins::ResourcesController < AdminsController
  before_action :set_resource, only: :show

  authorize_resource

  def index
    @resources = Resource.alphabetical
  end
  
  def show
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

end
