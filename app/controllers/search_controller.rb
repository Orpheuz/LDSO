class SearchController < ApplicationController

  def index
    if params[:SCN].present?
      if params[:SCN] == 'Name'
        @search = Recipe.search do
          fulltext params[:search] do
            fields(:name)
          end
          if(params[:number])
            without(:time).greater_than(params[:number][0])
          end
          params.delete :number
          order_by :time, :asc
          paginate :per_page => 15
        end
        @recipes = @search.results
      else
        if params[:SCN] == 'Tag'
          @search = Tag.search do
            fulltext params[:search] do
              fields(:name)
            end
            paginate :per_page => 15
          end
          @tags = @search.results

          recipes = Array.new
          @tags.each do |tag|
            RecipeTagAssociation.where(tag_id: tag.id).each do |rta|
              recipes.push(Recipe.find(rta.recipe_id))
            end
          end

          @recipes = recipes
        end
      end
    else
      @recipes = Recipe.all
    end
  end
end
