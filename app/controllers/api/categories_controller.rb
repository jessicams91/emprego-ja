module Api
  class CategoriesController < ApplicationController
    respond_to :json
    def jobs
      @category = Category.find(params[:id]).jobs
      respond_with @category
    end

    def index
      @category = Category.all
      respond_with @category
    end

    def show
      @category = Category.find(params[:id])
      respond_with @category
    end
  end
end
