module Api
  class CompaniesController < ApplicationController
    before_action :set_company, only: [:edit, :update, :show]
    before_action :authenticate_user!, except: [:index, :show]
    respond_to :json
    def index
      @company = Company.all
      respond_with @company
    end

    def new
      @company = Company.new
    end

    def create
      @company = Company.create(company_params)
      @company.user = current_user
      respond_with @company
    end

    def edit
      respond_with @company
    end

    def update
      @company.update(company_params)
      respond_with @company
    end

    def show
      if current_user
        @user_companies = Company.where(user: current_user)
      else
        @user_companies = []
      end
      respond_with @company
    end

    private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :location, :mail, :phone)
    end
  end
end
