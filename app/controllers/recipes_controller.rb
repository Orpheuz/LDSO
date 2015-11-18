  class RecipesController < ApplicationController
    def show
      @recipe = Recipe.find(params[:id])
      @ingredients = @recipe.ingredients
      @reviews=@recipe.comments.where(type: 'Review')
      @suggestions=@recipe.comments.where(type: 'Suggestion')
      @tips=@recipe.comments.where(type: 'Tip')
      @comment=Comment.new(:recipe_id=>@recipe.id)
      if(current_user)
        @bookmark_visible=true
        if Bookmark.exists?(recipe_id: params[:id], user_id: current_user.id)
          @bookmark_visible=false
        end
      end
    end

    def new
      @recipe=Recipe.new
      gon.push({
                   :categories => Category.all,
                   :current_user => current_user
               })
    end

    def create

      @recipe = current_user.recipes.create(name: params[:recipe][:name], description: params[:recipe][:description])
      stepID=0
      categoryN = 0
      while params[:S][stepID].present? do
        @step= @recipe.steps.create(name: params[:SN][stepID], description: params[:S][stepID],stepnumber: stepID+1)
        stepID=stepID+1
      end

      if params[:CN].present?
        while params[:CN][categoryN].present? do
          @temp = params[:CN][categoryN].to_f
          @category = Category.find(@temp)
          if @recipe.save
            @recipe.categories << @category
          else
            render :new
          end
          categoryN=categoryN+1
        end
      end

      if params[:tags].present?
        @tagarray = params[:tags].split(/[\s,]+/)
        @tagarray.each do |tag|
            @tag = Tag.find_by_name(tag)
            if @tag.nil?
              @tag = @recipe.tags.create(name: tag)
            else
              if @recipe.save
                @tag.recipes << @recipe
              else
                render :new
              end
            end
        end
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
