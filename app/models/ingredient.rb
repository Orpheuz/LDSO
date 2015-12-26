class Ingredient < ActiveRecord::Base


  has_many :ingredient_recipe_associations
  has_many :recipes, through: :ingredient_recipe_associations
end
