class Recipe < ActiveRecord::Base

 has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/images/default_food.jpg"



  belongs_to :user
  has_many :ingredient_recipe_associations
  has_many :ingredients, through: :ingredient_recipe_associations
  has_many :steps
  has_many :bookmarks
  has_many :categories, through: :categories_to_recipes
  has_many :tags, through: :recipe_tag_associations
  has_many :recipe_tag_associations
  has_many :categories_to_recipes
  ratyrate_rateable "rating"
  has_many :comments


  include StreamRails::Activity
  as_activity

  def activity_actor
    self.user
  end

  def activity_object
    self
  end



end
