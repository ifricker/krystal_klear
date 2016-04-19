class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:show, :index, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @client = Client.find(params[:client_id])
    @jobs = @client.jobs
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @client = Client.find(params[:client_id])
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @client = Client.find_by(id: params[:client_id])
  end

  # GET /jobs/1/edit
  def edit
    @client = Client.find(params[:client_id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params.merge({client_id: params[:client_id]}))
    respond_to do |format|
      if @job.save
        @client = Client.find(params[:client_id])
        format.html { redirect_to client_job_path(@client, @job), notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    @client = Client.find(params[:client_id])
    respond_to do |format|
      if @job.update(job_params)
        @client = Client.find(params[:client_id])
        format.html { redirect_to client_job_path(@client, @job), notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @client = Client.find(params[:client_id])
    @job.destroy
    respond_to do |format|
      format.html { redirect_to client_path(@client), notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find_by(id: params[:id])
    end

    def is_admin?
      unless current_user && current_user.admin?
        flash[:error] = "You must be an administrator in to access this section"
        redirect_to "/" # halts request cycle
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:name, :description, :frequency, :estimated_price, :client_id, :route_id)
    end
end
