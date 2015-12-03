class Comment < ActiveRecord::Base
  belongs_to :recipe
  ratyrate_rateable "points"


  include StreamRails::Activity
  as_activity

  def activity_actor
    self.recipe.user
  end

  def activity_object
    self
  end


end
