class Tag < ActiveRecord::Base
  searchable do
    text :name
  end


  has_many :recipes, through: :recipe_tag_associations
  has_many :recipe_tag_associations
end
