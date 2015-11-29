class HomeController < ApplicationController

	def index
		  @categories = Category.all
			if current_user
				@users = current_user.following_users
				@users_id = @users.pluck(:id)
				@comments = Comment.all.where(user_id: @users_id)
			end

	end

end
