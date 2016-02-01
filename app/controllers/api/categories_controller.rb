module Api
  class CategoriesController < ApplicationController
    before_action :authenticate_user!, except: [:show]
    respond_to :json
    def show
      @category = Category.find(params[:id])
      respond_with @category
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.create(name: params[:category][:name])
      respond_with @category
    end
  end
end
