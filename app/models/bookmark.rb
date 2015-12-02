class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe



  include StreamRails::Activity
  as_activity

  def activity_actor
    self.user
  end


  def activity_object
    self.recipe
  end




end
