class IngredientSuggestionController < ApplicationController
  def new
    @ingSugestion = IngredientSuggestion.new
  end

  def create
    @ingSugestion = IngredientSuggestion.create(name: params[:ingredient_suggestion][:name], calories: params[:ingredient_suggestion][:calories])
    redirect_to root_path
  end

end
