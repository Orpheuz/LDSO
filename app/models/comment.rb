class Comment < ActiveRecord::Base
  belongs_to :recipe
  ratyrate_rateable "points"
end
