class ResourcesController < ApplicationController
  before_action :set_resource, only: [:collect_one, :show, :edit, :update, :destroy]
  authorize_resource

  # GET /resources
  def index
    @resources = Resource.all
  end

  # GET /resources/1
  def show
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
      render :new
    end
  end

  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: 'Resource was successfully updated.'
    else
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
      @resource = Resource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:resource).permit(:id, :description, :href, :name, :type, :organization, :org_href, :org_description)
    end
end
