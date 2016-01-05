class SearchController < ApplicationController

  def index
   # @recipes = Recipe.all
    if params[:name].present?
      @recipes = Recipe.where("name LIKE ?", "%#{params[:name]}%")
    end

    if params[:tags].present?
      recipes = Array.new
      tag = Array.new
      empty = true
      @tagarray = params[:tags].split(/[\s,]+/)
      @tagarray.each do |t|
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
        if @recipes.present?
          @recipes = @recipes & recipes.uniq
        else
          @recipes = recipes.uniq
        end
      end
    end

    if params[:searchIng].present?
      recipes = Array.new
      ingred = Array.new
      empty = true
      @ingarray = params[:searchIng].split(/[,]+/)
      @ingarray.each do |pIng|
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
       if @recipes.present?
         @recipes = @recipes & recipes.uniq
       else
         @recipes = recipes.uniq
       end
      end
    end

    if params[:number].present?
      time = params[:number].to_f
      if time != 0
        recipes = Recipe.where("time <= ?", "#{time}")
        if @recipes.present?
          @recipes = @recipes & recipes.uniq
        else
          @recipes = recipes.uniq
        end
      end
    end

    if params[:difficulty].present?
        recipes = Recipe.where("difficulty LIKE ?", "#{params[:difficulty]}")
        if @recipes.present?
          @recipes = @recipes & recipes.uniq
        else
          @recipes = recipes.uniq
        end
    end

  end
end
