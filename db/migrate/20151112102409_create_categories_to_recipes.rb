class CreateCategoriesToRecipes < ActiveRecord::Migration
  def change
    create_table :categories_to_recipes do |t|
      t.integer :category_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
