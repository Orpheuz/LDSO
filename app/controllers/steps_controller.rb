class StepsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:id])
    @steps = Recipe.find(params[:id]).steps.order(:stepnumber)
  end
end
