class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.belongs_to :recipe, index: true
      t.text :comment_text
      t.text :type
      t.timestamps null: false
    end
  end


end
