module Api
  class CompaniesController < ApplicationController
    respond_to :json
    def index
      @company = Company.all
      respond_with @company
    end

    def show
      @company = Company.find(params[:id])
      company_decorated = CompanyDecorator.new(@company)
      respond_with company_decorated
    end

    def jobs
      @company = Company.find(params[:id]).jobs
      respond_with @company
    end

    private

    def company_params
      params.require(:company).permit(:name, :location, :mail, :phone)
    end
  end
end
