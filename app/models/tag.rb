class Tag < ActiveRecord::Base

  has_many :recipes, through: :recipe_tag_associations
  has_many :recipe_tag_associations
end
