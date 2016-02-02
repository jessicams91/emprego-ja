module Api
  class JobsController < ApplicationController
    respond_to :json

    def index
      @job = Job.all
      respond_with @job
    end

    def show
      @job = Job.find(params[:id])
      respond_with @job
    end
  end
end
