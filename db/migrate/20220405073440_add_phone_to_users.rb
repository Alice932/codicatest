class AddPhoneToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone, :string
    add_index :users, :phone, unique: true
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
