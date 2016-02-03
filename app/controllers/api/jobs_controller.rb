module Api
  class JobsController < ApplicationController
    respond_to :json

    def index
      @job = Job.all
      respond_with @job
    end

    def show
      @job = Job.find(params[:id])
      job_decorated = JobDecorator.new(@job)
      respond_with job_decorated
    end
  end
end
