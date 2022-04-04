class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.timestamps
    end
    create_table :doctors do |t|
      t.string :name, null: false
      t.timestamps
    end
    create_table :appointments do |t|
      t.belongs_to :physician
      t.belongs_to :patient
      t.string :description, null: false, default: ""
      t.timestamps
    end
  end
end
