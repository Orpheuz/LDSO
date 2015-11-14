class Category < ActiveRecord::Base
  has_many :recipes, through: :categories_to_recipes
  has_many :categories_to_recipes
end
