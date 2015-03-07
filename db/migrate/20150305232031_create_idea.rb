class CreateIdea < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :title
      t.text :body
    end
  end
end
