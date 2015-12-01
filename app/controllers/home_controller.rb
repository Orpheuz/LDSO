class HomeController < ApplicationController

	def index
		@categories = Category.all
		if(current_user)
			enricher = StreamRails::Enrich.new
			feed = StreamRails.feed_manager.get_user_feed(current_user.id)
			results = feed.get()['results']
			@activities = enricher.enrich_activities(results)
		end
	end

end
