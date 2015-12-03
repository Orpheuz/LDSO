class UsersController < ApplicationController
	def show
		@user = User.friendly.find(params[:id])
		@recipes = Recipe.where(user_id: @user.id)
		if current_user

		end
	end



end
