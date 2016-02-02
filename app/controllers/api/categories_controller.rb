module Api
  class CategoriesController < ApplicationController
    respond_to :json
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
