class CreateRole < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.text :title
    end
  end
end
