class SignsController < ApplicationController
  before_action :set_sign, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!
  before_filter :set_last_updated_at, only: [:index]

  # GET /signs
  def index
    @signs = Sign.order('UPPER(name)')

    if params[:only]
      @signs = @signs.where(category: params[:only])
    end

    @show_images = !params[:show_images].present?
  end

  # GET /signs/new
  def new
    @sign = Sign.new
    @all_categories_for_sign = Sign.where(name: @sign.name).pluck(:category)
  end

  # GET /signs/1/edit
  def edit
    @all_categories_for_sign = Sign.where(name: @sign.name).pluck(:category)
  end

  # POST /signs
  def create
    success = (sign_params[:categories].presence || []).all? do |category|
      @sign = Sign.new(sign_params.except(:categories).merge(category: category))
      @sign.save
    end

    success_or_redirect(success && sign_params[:categories].present?, t('helpers.was_created', model: 'Skilt'), 'new')
  end

  # PATCH/PUT /signs/1
  def update
    name_was = @sign.name

    success = @sign.update(sign_params.except(:categories))

    success &&= (sign_params[:categories].presence || []).all? do |category|
      (category == @sign.category) or update_signs(category, name_was)
    end

    success_or_redirect(success && sign_params[:categories].present?, t('helpers.was_updated', model: 'Skilt'), 'edit')
  end

  # DELETE /signs/1
  def destroy
    @sign.destroy
    Rails.cache.clear

    redirect_to signs_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sign
      @sign = Sign.find(params[:id])
    end

    def success_or_redirect(success, notice, action)
      if success
      redirect_to signs_path, notice: notice
      else
        render action: action
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sign_params
      params.require(:sign).permit(:name, :faction_number, :search_terms, :comment, :image, { categories: [] })
    end

    def set_last_updated_at
      @last_sign_updated = Sign.order(updated_at: :desc).select(:updated_at).first.updated_at.to_i
    end

    def update_signs(category, name_was)
      att = sign_params.except(:categories).merge(category: category)
      signs = Sign.where(category: category, name: name_was)

      if signs.present?
        signs.all? { |sign| sign.update_attributes(att) }
      else
        sign = Sign.new(att)
        sign.save
      end
    end
end
