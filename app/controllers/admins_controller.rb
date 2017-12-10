class AdminsController < ApplicationController
 / before_action :set_admin, only: [:show, :edit, :update, :destroy]
/
  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.find(params[:id])
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      log_in @admin
      flash[:success] = "admin logged in"
      redirect_to @admin
    else
      render 'new'
    end
  end

  def admin_params
    params.require(:admin).permit(:name, :role, :password,)
  end
end