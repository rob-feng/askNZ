class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :nickname, limit: 20
      t.string :email, limit: 50
      t.string :password_digest
      t.string :gender, limit: 1
      t.date :birthday

      t.timestamps null: false
    end
    add_index :users, :nickname, unique: true
    add_index :users, :email, unique: true
  end
end
