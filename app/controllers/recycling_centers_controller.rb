class RecyclingCentersController < ApplicationController
  before_action :set_recycling_center, only: [:show, :edit, :update, :destroy]

  # GET /recycling_centers
  def index
    @recycling_centers = RecyclingCenter.order(:name)
  end

  # GET /recycling_centers/1
  def show
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
      raise params.inspect
      params.require(:recycling_center).permit(:name, :address, :latitude, :longitude, :category, { :factions => [] })
    end
end
