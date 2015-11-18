class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy, :sort]
  authorize_resource

  # GET /collections
  def index
    @collections = Collection.featured(20)
  end

  # GET /collections/1
  def show
    @resource_collections = @collection.resource_collections.includes(:resource).order("position")
  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  def create
    @collection = current_user.collections.new(collection_params)

    if @collection.save
      redirect_to @collection, notice: 'Collection was successfully created.'
    else
      render :new
    end
  end

  # POST /collections/1/sort
  def sort
    params[:resource].each_with_index do |id, index|
      ResourceCollection.where({resource_id: id, collection_id: @collection.id}).update_all({position: index+1})
    end
    render nothing: true
  end

  # PATCH/PUT /collections/1
  def update
    if @collection.update(collection_params)
      redirect_to @collection, notice: 'Collection was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /collections/1
  def destroy
    @collection.destroy
    redirect_to current_user, notice: 'Collection was successfully destroyed.'
  end

  private
    def set_collection
      @collection = Collection.find(params[:id])
    end

    def collection_params
      params.require(:collection).permit(:name, :image, :description)
    end
end
