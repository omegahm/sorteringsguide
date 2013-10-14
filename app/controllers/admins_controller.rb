class AdminsController < ApplicationController
  before_action :set_admin, only: [:edit, :update, :destroy]
  before_filter :authenticate_admin!

  # GET /users
  def index
    @admins = Admin.order(email: :desc)

    @last_admin_updated = Admin.order(updated_at: :desc).select(:updated_at).first.updated_at.iso8601
  end

  # GET /users/new
  def new
    @admin = Admin.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to users_path, notice: t('helpers.was_created', model: 'Admin')
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    aparams = admin_params.to_hash
    if !aparams["password"].present? or aparams["password"].blank?
      aparams.delete("password")
      aparams.delete("password_confirmation")
    end

    if @admin.update_attributes(aparams)
      redirect_to users_path, notice: t('helpers.was_updated', model: 'Admin')
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @admin.destroy

    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation, :mails)
    end
end
