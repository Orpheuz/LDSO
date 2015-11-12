class Category < ActiveRecord::Base
  has_many :recipes, :through => :period_to_user
end
