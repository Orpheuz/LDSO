class UsersController < ApplicationController
	def show
		@user = User.friendly.find(params[:id])
		@recipes = Recipe.where(user_id: @user.id)
		if current_user
			@followable=true
			if Follow.exists?(followable_id: params[:id], follower_id: current_user.id)
				@followable=false
			end
		end
	end

	def follow
		@user = User.find(params[:id])
		current_user.follow(@user)
		redirect_to :back
	end

	def unfollow
		@user = User.find(params[:id])
		if current_user
			current_user.stop_following(@user)
			flash[:error] = "You are no longer following #{@user.username}."
		end
		redirect_to :back
	end

end
