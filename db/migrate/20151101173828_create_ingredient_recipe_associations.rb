class CreateIngredientRecipeAssociations < ActiveRecord::Migration
  def change
    create_table :ingredient_recipe_associations do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :ingredient, index: true
      t.integer :quantity
      t.timestamps
    end
  end
end
