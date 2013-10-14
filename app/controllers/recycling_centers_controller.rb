class RecyclingCentersController < ApplicationController
  before_action :set_recycling_center, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!, except: [:show]

  # GET /recycling_centers
  def index
    @last_recycling_center_updated = RecyclingCenter.order(updated_at: :desc).select(:updated_at).first.updated_at.iso8601

    @recycling_centers = Rails.cache.fetch("c_recycling_center_#{@last_recycling_center_updated}") do
      RecyclingCenter.order(:name)
    end
  end

  # GET /recycling_centers/1
  def show
    @factions = @recycling_center.factions

    @last_sign_updated = Sign.order(updated_at: :desc).select(:updated_at).first.updated_at.iso8601

    @signs = Rails.cache.fetch("c_signs_#{@last_sign_updated}") do
      Sign.for_factions(@factions, @recycling_center.category).select("name, faction_number, comment, image_file_name, (search_terms || ', ' || name) AS search_terms")
    end
  end

  # GET /recycling_centers/new
  def new
    @recycling_center = RecyclingCenter.new
  end

  # GET /recycling_centers/1/edit
  def edit
  end

  # POST /recycling_centers
  def create
    @recycling_center = RecyclingCenter.new(recycling_center_params)
    if @recycling_center.save
      redirect_to recycling_centers_path, notice: 'Recycling center was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /recycling_centers/1
  def update
    if @recycling_center.update(recycling_center_params)
      redirect_to recycling_centers_path, notice: 'Recycling center was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /recycling_centers/1
  def destroy
    @recycling_center.destroy

    redirect_to recycling_centers_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recycling_center
      @recycling_center = RecyclingCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recycling_center_params
      params.require(:recycling_center).permit(:name, :address, :latitude, :longitude, :category, { :factions => [] })
    end
end
