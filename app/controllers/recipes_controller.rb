class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end

  def new
    @recipe=Recipe.new

  end

  def create

    @recipe = current_user.recipes.create(name: params[:recipe][:name], description: params[:recipe][:description])
    stepID=0

    while params[:S][stepID].present? do
      @step= @recipe.steps.create(name: params[:SN][stepID], description: params[:S][stepID],stepnumber: stepID+1)
      stepID=stepID+1
    end

    redirect_to "/recipes/"+@recipe.id.to_s
  end
  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end
