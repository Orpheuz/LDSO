class SearchController < ApplicationController

  def index
    @search = Recipe.search do
      fulltext params[:search] do
        fields(:name)
      end
    end


    @recipes = @search.results
  end

end
