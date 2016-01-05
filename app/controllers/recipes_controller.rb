class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @rCalories = 0
    @ingredients.each do |ing|
      @rCalories +=  ing.calories * IngredientRecipeAssociation.where("recipe_id = ? and ingredient_id = ?", @recipe.id, ing.id).first.quantity
    end
    @reviews=@recipe.comments.where(typen: 'Review')
    @suggestions=@recipe.comments.where(typen: 'Suggestion')
    @tips=@recipe.comments.where(typen: 'Tip')
    @comment=Comment.new(:recipe_id=>@recipe.id)
    @author=User.find(@recipe.user_id)
    @tags=@recipe.tags
    if(current_user)
      @bookmark_visible=true
      if Bookmark.exists?(recipe_id: params[:id], user_id: current_user.id)
        @bookmark_visible=false
      end
    end
    gon.push({
     :current_user => current_user
    })
  end

  def new
    @recipe=Recipe.new
    gon.push({
     :categories => Category.all,
     :current_user => current_user
     })
  end

  def search
    @ingredients = Ingredient.where("name LIKE ?", "%#{params[:ingredients]}%")
  end


  def recipe_params
    params.require(:recipe).permit(:image)
  end

  def create
    totalTime=0
    params[:T].each do |t|
      totalTime=totalTime+t.to_f
    end

    params.require(:recipe).permit(:image)
    @recipe = current_user.recipes.create!(name: params[:recipe][:name], description: params[:recipe][:description],time: totalTime,difficulty: params[:difficulty],media: params[:media], portions: params[:portions])
    stepID=0

    while params[:S][stepID].present? do
      @step= @recipe.steps.create(time: params[:T][stepID],name: params[:SN][stepID], description: params[:S][stepID],media: params[:SM][stepID],stepnumber: stepID+1)
      stepID=stepID+1
    end

    if params[:CN].present?
      categoryN = 0
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

    if params[:IN].present?
      ingredientN = 0
      while params[:IN][ingredientN].present? do
       @temp = params[:IN][ingredientN].to_f
       @ingredient = Ingredient.find(@temp)
       if @recipe.save
         @recipe.ingredients << @ingredient
         @association = IngredientRecipeAssociation.where("recipe_id = ? and ingredient_id = ?", @recipe.id, @ingredient.id).first
         @association.update(quantity: params[:quantity][ingredientN])
       else
         render :new
       end
       ingredientN=ingredientN+1
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
        flash[:error] = "The user you tried to access doesn't exist."
        redirect_to root_url
        endto '/'
      end
    end

    def edit
      @recipe=Recipe.find(params[:id])
      @ingredients=@recipe.ingredients
      @steps=@recipe.steps
      @tags=@recipe.tags
      @tagStringArr=Array.new
      @tags.each  do |tagStr|
        @tagStringArr.push(tagStr.name)
      end
      @tagSentence=@tagStringArr.push(" ").join(', ')
    end

    def update
      @recipe=Recipe.find(params[:id])
      @steps=@recipe.steps
      @ingredients=@recipe.ingredients

      if params[:new_name].present?
        @recipe.update(name: params[:new_name])
      end

      if params[:new_description].present?
        @recipe.update(description: params[:description])
      end

      stepID=0
      @steps.each do |s|
        if params[:SN][stepID] != s.name
          s.update(name: params[:SN][stepID])
        end
        if params[:S][stepID] != s.description
          s.update(description: params[:S][stepID])
        end
        stepID=stepID+1
      end

      IngredientRecipeAssociation.destroy_all(:recipe_id => @recipe.id)

      if params[:IN].present?
        ingredientN = 0
        while params[:IN][ingredientN].present? do
          @temp = params[:IN][ingredientN].to_f
          @ingredient = Ingredient.find(@temp)
            @recipe.ingredients << @ingredient
          ingredientN=ingredientN+1
        end
      end

      RecipeTagAssociation.destroy_all(:recipe_id => @recipe.id)
      if params[:tags].present?
        @tagarray = params[:tags].split(/[\s,]+/)
        @tagarray.each do |tag|
          @tag = Tag.find_by_name(tag)
          if @tag.nil?
            @tag = @recipe.tags.create(name: tag)
          else
            @tag.recipes << @recipe
          end
        end
      end

      redirect_to :back

    end

  def destroy
    @recipe=Recipe.find(params[:id])
    @tags=@recipe.tags
    RecipeTagAssociation.destroy_all(:recipe_id => @recipe.id)
    @steps=@recipe.steps
    @steps.destroy_all()
    @ingredients=@recipe.ingredients
    IngredientRecipeAssociation.destroy_all(:recipe_id => @recipe.id)
    @recipe.destroy
    flash[:success] = "Recipe deleted"
    redirect_to home_index_path
  end

end
