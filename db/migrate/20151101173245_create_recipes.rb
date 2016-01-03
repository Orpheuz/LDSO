class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :difficulty
      t.float :time
      t.text :media
      t.timestamps
    end
  end
end
