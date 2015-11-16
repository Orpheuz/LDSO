class SearchController < ApplicationController

  def index

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
  end

end
