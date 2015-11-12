class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredient_recipe_associations
  has_many :ingredients, through: :ingredient_recipe_associations
  has_many :steps
  has_many :bookmarks
  has_many :categories, :through => :period_to_user
  ratyrate_rateable "rating"

end
