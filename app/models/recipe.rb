class Recipe < ActiveRecord::Base
  has_many :ingredient_recipe_associations
  has_many :ingredients, through: :ingredient_recipe_associations
  has_many :steps
end
