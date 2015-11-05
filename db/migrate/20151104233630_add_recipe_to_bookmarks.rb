class AddRecipeToBookmarks < ActiveRecord::Migration
  def change
    add_reference :bookmarks, :recipe, index: true
  end
end
