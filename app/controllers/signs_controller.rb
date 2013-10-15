class SignsController < ApplicationController
  before_action :set_sign, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!

  # GET /signs
  def index
    @signs = Sign.order("UPPER(name)")

    if params[:only]
      @signs = @signs.where(category: params[:only])
    end

    @show_images = params[:show_images]

    @last_sign_updated = Sign.order(updated_at: :desc).select(:updated_at).first.updated_at.to_i
  end

  # GET /signs/1
  def show
  end

  # GET /signs/new
  def new
    @sign = Sign.new
  end

  # GET /signs/1/edit
  def edit
  end

  # POST /signs
  def create
    @sign = Sign.new(sign_params)

    if @sign.save
      redirect_to signs_path, notice: t('helpers.was_created', model: 'Skilt')
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /signs/1
  def update
    if @sign.update(sign_params)
      redirect_to signs_path, notice: t('helpers.was_updated', model: 'Skilt')
    else
      render action: 'edit'
    end
  end

  # DELETE /signs/1
  def destroy
    @sign.destroy

    redirect_to signs_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sign
      @sign = Sign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sign_params
      params.require(:sign).permit(:name, :faction_number, :search_terms, :comment, :category, :image)
    end
end
