class Admin::ResourcesController < AdminsController
  before_action :set_resource, only: [:show, :edit, :update]

  authorize_resource

  # GET admins/resources
  def index
    @resources = Resource.alphabetical
  end

  # GET admins/resources/1/edit
  def edit
    @users = User.alphabetical
  end
  
  # GET admins/resources/1/
  def show
  end

  # PATCH/PUT admins/resources/1
  def update
    @resource = @resource.becomes(Resource)
    if @resource.update(resource_params)
      redirect_to admin_resource_path(@resource), notice: 'Resource was successfully updated.'
    else
      @users = User.alphabetical
      render :edit
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    def resource_params
      params.require(:resource).permit(:id, :description, :href, :name, :user_id, :image, :type)
    end

end
