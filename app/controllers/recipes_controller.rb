  class RecipesController < ApplicationController
    def show
      @recipe = Recipe.find(params[:id])
      @ingredients = @recipe.ingredients
      if(current_user)
        @bookmark_visible=true
        if Bookmark.exists?(recipe_id: params[:id], user_id: current_user.id)
          @bookmark_visible=false
        end
      end
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

      redirect_to recipe_path(@recipe.id)
    end

    def bookmark

      type = params[:type]
      @recipe = Recipe.find(params[:id])
      if type=="add"
        @bookmark = current_user.bookmarks.create(recipe_id: params[:id])
        redirect_to :back
      elsif type=="remove"
        bookmark=@recipe.bookmarks.find_by(user_id: current_user.id)
        bookmark.destroy
        redirect_to :back
      end

    end

    def viewbookmarks
      if User.exists?(:id => params[:id])
        @bookmarks=Recipe.joins(:bookmarks).where("bookmarks.user_id=?", params[:id])
      else
        redirect_to '/'
      end
    end



    private

    def recipe_params
      params.require(:recipe).permit(:name, :description)
    end
  end
