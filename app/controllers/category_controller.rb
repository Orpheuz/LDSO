class CategoryController < ApplicationController
  def index
    @categories = category.all()
  end
  def new
    @category=Category.new

  end

  def create

    @category = Category.create(name: params[:category][:name])
    redirect_to root_path
  end
end