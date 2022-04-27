class AddEmail < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :email, :string, default: ""
  end
end
