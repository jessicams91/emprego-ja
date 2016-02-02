class HomeController < ApplicationController
  respond_to :html
  def index
    @jobs = Job.all
    @companies = Company.all
    @categories = Category.all
    @job_types = JobType.all
  end
end
