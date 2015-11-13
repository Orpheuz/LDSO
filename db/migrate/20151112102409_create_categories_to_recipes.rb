class CreateCategoriesToRecipes < ActiveRecord::Migration
  def change
    create_table :categories_to_recipes do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :categories, index: true
      t.timestamps
    end
  end
end
