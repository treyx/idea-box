class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email_address
      t.text :password_digest
      t.text :username
    end
  end
end
