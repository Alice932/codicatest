class AddColumnDoctor < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :patients_ids, :string, array: true, default: []
  end
end
