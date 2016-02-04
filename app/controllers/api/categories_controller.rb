module Api
  class CategoriesController < ApplicationController
    #
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
      category_decorated = CategoryDecorator.new(@category)
      respond_with category_decorated
    end
  end
end
