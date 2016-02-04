class JobsController < ApplicationController
  before_action :set_collections, only: [:new, :create, :edit]
  before_action :set_job, only: [:edit, :show, :update]
  before_action :authenticate_user!, except: [:show]
  respond_to :html

  def show
    respond_with @job
  end

  def new
    @job = Job.new
  end

  def edit
    respond_with @job
  end

  def update
    @job.update(job_params)
    respond_with @job
  end

  def create
    @job = Job.create(job_params)
    respond_with @job
  end

  private

  def set_collections
    @categories = Category.all
    @companies = Company.all
    @job_types = JobType.all
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job)
          .permit(:title, :location, :category_id, :description, :featured,
                  :company_id, :job_type_id)
  end
end
