class CategoryController < ApplicationController

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @recipes = @category.recipes
  end

  def index
    @categories = Category.all
    gon.push({
                 :categories => @categories
             })
  end
  def new
    @category=Category.new
  end

  def create
    @category = Category.create(name: params[:category][:name])
    redirect_to root_path
  end
end
