class RecipeTagAssociation < ActiveRecord::Base
  belongs_to :tag
  belongs_to :recipe
end
