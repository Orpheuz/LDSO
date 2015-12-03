class HomeController < ApplicationController

	def index
		@categories = Category.all
		if(current_user)
			enricher = StreamRails::Enrich.new
			feed = StreamRails.feed_manager.get_news_feeds(current_user.id)[:flat]

			results = feed.get()['results']
			@activities = enricher.enrich_activities(results)
		end
	end

end
