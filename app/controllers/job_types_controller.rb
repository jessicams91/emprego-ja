class JobTypesController < ApplicationController
  respond_to :html
  def show
    @job_type = JobType.find(params[:id])
  end
end
