class ResourceCollectionsController < ApplicationController
  before_action :set_resource_collection, only: [:update]
  authorize_resource
  
  # PUT/PATCH /resource_collections/1/update
  def update
    respond_to do |format|
      if @resource_collection.update(resource_collection_params)
        format.js
      else
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_collection
      @resource_collection = ResourceCollection.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_collection_params
      params.require(:resource_collection).permit(:description)
    end
end
