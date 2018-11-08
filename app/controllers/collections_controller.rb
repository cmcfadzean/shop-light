class CollectionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  # GET /collections
  # GET /collections.json
  def index
    #site = Site.find(params[:site_id])
    site = Site.find_by!(id: params[:site_id], user_id: current_user.id)
    @collections = site.collections
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    site = Site.find_by!(id: params[:site_id], user_id: current_user.id)
    @collection = site.collections.find(params[:id])
  end

  # GET /collections/new
  def new
    site = Site.find_by!(id: params[:site_id], user_id: current_user.id)
    @collection = site.collections.build
  end

  # GET /collections/1/edit
  def edit
    site = Site.find_by!(id: params[:site_id], user_id: current_user.id)
    @collection = site.collections.find(params[:id])
  end

  # POST /collections
  # POST /collections.json
  def create
    site = Site.find_by!(id: params[:site_id], user_id: current_user.id)
    @collection = site.collections.create(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to site_collections_path(@collection.site), notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: [@collection.site, @collection] }
      else
        format.html { render :new }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    site = Site.find(params[:site_id])
    @collection = site.collections.find(params[:id])

    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to site_collections_path(@collection.site), notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: [@collection.site, @collection] }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    site = Site.find(params[:site_id])
    @collection = site.collections.find(params[:id])
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to site_collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params.require(:collection).permit(:title, :shopify_id, :site_id)
    end
end
