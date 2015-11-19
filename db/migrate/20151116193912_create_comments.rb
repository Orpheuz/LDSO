class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.belongs_to :recipe, index: true
      t.text :comment_text
      t.text :typen
      t.timestamps null: false
      t.text :media
    end
  end


end
