class Ingredient < ActiveRecord::Base
  searchable do
    text :name
    integer :calories
  end

  has_many :ingredient_recipe_associations
  has_many :recipes, through: :ingredient_recipe_associations
end
