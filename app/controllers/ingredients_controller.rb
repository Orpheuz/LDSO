class IngredientsController < ApplicationController
  def index

    if params[:ingredientsinput].present?
      @search = Ingredient.search do
        fulltext params[:ingredientsinput] do
          fields(:name)
        end
        paginate :per_page => 15
      end
      @ingredients = @search.results
      gon.push({
                   :recing => @ingredients
               })
    else
      @ingredients = Ingredient.all
    end

  end
end
