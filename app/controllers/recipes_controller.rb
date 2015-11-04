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
    sturl="/recipes/"+@recipe.id.to_s
    redirect_to sturl

  end
  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end
