class ResourcesController < ApplicationController
  before_action :set_resource, only: [:collect_one, :show, :edit, :update, :destroy]
  authorize_resource

  # GET /resources
  def index
    #top resources, by collections_count
    @resources = Resource.top(10).map { |r| r.becomes(Resource) }
  end

  # GET /resources/1
  def show
    @collections = @resource.collections.order(created_at: :asc)
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # POST /resources/1/collect_one.js
  def collect_one
    # raise params.inspect
    new_ids = params[:resource][:collection_ids]
    old_ids = current_user.collections.includes(:resources).where(resources: {id: @resource.id}).map(&:id) 
    diff_ids = (new_ids - old_ids) | (old_ids - new_ids)
    diff_ids.each do |id|
      begin
        coll = Collection.find(id)
        if coll.owner == current_user
          if coll.resources.include?(@resource)
            coll.resources.delete(@resource)
          else
            coll.resources.push(@resource)
            coll.resource_collections.where(resource_id: @resource.id).each { |x| x.update(description: @resource.description) }
          end
        end
      rescue ActiveRecord::RecordNotFound => e
      end
    end
    respond_to do |format|
      format.js
    end
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  def create
    @resource = current_user.resources.new(resource_params)
    if @resource.save
      redirect_to resource_path(@resource), notice: 'Resource was successfully created.'
    else
      @resource = @resource.becomes(Resource)
      render :new
    end
  end

  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: 'Resource was successfully updated.'
    else
      @resource = @resource.becomes(Resource)
      render :edit
    end
  end

  # DELETE /resources/1
  def destroy
    @resource.destroy
    redirect_to resources_url, notice: 'Resource was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id]).becomes(Resource)
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:resource).permit(:id, :description, :href, :name, :image, :type)
    end
end
