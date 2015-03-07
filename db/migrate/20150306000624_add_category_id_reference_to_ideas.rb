class AddCategoryIdReferenceToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :category, index: true
    add_foreign_key :ideas, :categories
  end
end
