class JobTypesController < ApplicationController
  respond_to :html
  def show
    @job_type = JobType.find(params[:id])
  end

  def new
    @job_type = JobType.new
  end

  def create
    @job_type = JobType.create(name: params[:job_type][:name])
    respond_with @job_type
  end
end
