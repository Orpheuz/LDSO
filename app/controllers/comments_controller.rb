class CommentsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @comment=Comment.new(:recipe_id=>@recipe.id)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.create(comment_text: params[:text], user_id: current_user.id, typen: params[:typecom])
    redirect_to @recipe
  end

end