class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:index, :edit, :update, :destroy]
  # before_action :set_work_order, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.order("name")
    # @work_orders = WorkOrder.all
  end

  # GET /users/1/employees
  # GET /users/1/employees.json
  def employee
    if current_user.admin == true
      @user = User.find_by(id: params[:id])
      render :employee
    else
      redirect_to "/"
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    unless @user == current_user || is_admin?
      redirect_to "/"
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # def set_work_order
    #   @work_order = WorkOrder.find(params[:id])
    # end

    def is_admin?
      unless current_user && current_user.admin?
        flash[:error] = "You must be an administrator in to access this section"
        redirect_to "/" # halts request cycle
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :phone, :name, :admin, :hire_date)
    end
end
