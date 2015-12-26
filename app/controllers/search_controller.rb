class SearchController < ApplicationController

  def index
    @recipes = Recipe.all 
  end
  #   if params[:SCN].present?
  #     if params[:SCN] == 'Name'
  #       # @search = Recipe.search do
  #       #   fulltext params[:search] do
  #       #     fields(:name)
  #       #   end
  #       #   if(params[:number])
  #       #     without(:time).greater_than(params[:number][0])
  #       #     with(:difficulty).any_of([params[:difficulty]])
  #       #   end
  #       #   params.delete :number
  #       #   order_by :time, :asc
  #       #ends
  #       #@recipes = @search.results
  #     else
  #       if params[:SCN] == 'Tag'
  #         # @search = Tag.search do
  #         #   fulltext params[:search] do
  #         #     fields(:name)
  #         #   end
  #         #   if(params[:number])
  #         #     without(:time).greater_than(params[:number][0])
  #         #     with(:difficulty).any_of([params[:difficulty]])
  #         #   end
  #         #   params.delete :number
  #         #   order_by :time, :asc
  #         # end
  #         # @tags = @search.results
  #         #
  #         # recipes = Array.new
  #         # @tags.each do |tag|
  #         #   recipes.concat tag.recipes
  #         # end
  #         #
  #         # @recipes = recipes
  #       end
  #     end
  #   else
  #     @recipes = Recipe.all
  #   end
  #
  #   if params[:searchIng].present?
  #   #   recipes = Array.new
  #   #    params[:searchIng].each do |pIng|
  #   #     @search = Ingredient.search do
  #   #       fulltext pIng do
  #   #         fields(:name)
  #   #       end
  #   #     end
  #   #     @ingredients = @search.results
  #   #
  #   #
  #   #     @ingredients.each do |ing|
  #   #       recipes.concat ing.recipes
  #   #     end
  #   #   end
  #   #   @recipes = recipes.uniq
  #   # end
  # end
end
