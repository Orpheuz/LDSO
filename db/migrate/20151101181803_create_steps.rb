class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.belongs_to :recipe, index: true
      t.text :description
      t.string :name
      t.integer :stepnumber
      t.timestamps
    end
  end
end
