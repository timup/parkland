class Admins::CollectionsController < AdminsController
  before_action :set_collection, only: [:show, :feature]

	authorize_resource
  
  def index
    @collections = Collection.all
  end

  def show
  end

  # PUT /admins/collections/:id/feature
  def feature
    if @collection.toggle_featured
      render json: { success: true }
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

end