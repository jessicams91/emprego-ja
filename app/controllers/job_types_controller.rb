class JobTypesController < ApplicationController
  def show
    @job_type = JobType.find(params[:id])
  end
end
