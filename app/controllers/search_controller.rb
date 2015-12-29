class SearchController < ApplicationController

  def index
    @recipes = Recipe.all
    if params[:name].present?
      # @search = Recipe.search do
      #   fulltext params[:search] do
      #     fields(:name)
      #   end
      #   if(params[:number])
      #     without(:time).greater_than(params[:number][0])
      #     with(:difficulty).any_of([params[:difficulty]])
      #   end
      #   params.delete :number
      #   order_by :time, :asc
      #ends
      #@recipes = @search.results
      @recipes = @recipes & Recipe.where("name LIKE ?", "%#{params[:name]}%")
    end

    if params[:tags].present?
      recipes = Array.new
      tag = Array.new
      empty = true
      params[:tags].each do |t|
        if t.present?
          tag.concat Tag.where("name LIKE ?", "%#{t}%")
          empty = false
        end
      end
      @tags = tag.uniq

      @tags.each do |t|
        recipes.concat t.recipes
      end
      if !empty
        @recipes = @recipes & recipes.uniq
      end
    end

    if params[:searchIng].present?
      recipes = Array.new
      ingred = Array.new
      empty = true
      params[:searchIng].each do |pIng|
        if pIng.present?
          ingred.concat Ingredient.where("name LIKE ?", "%#{pIng}%")
          empty = false
        end
      end
      @ingredients = ingred.uniq

      @ingredients.each do |ing|
        recipes.concat ing.recipes
      end
      if !empty
        @recipes = @recipes & recipes.uniq
      end
    end
  end
end
