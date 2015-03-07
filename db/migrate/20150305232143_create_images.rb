class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :source
      t.text :description
    end
  end
end
