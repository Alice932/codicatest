class EditUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :patients do |t|
      t.string :recomendation
      t.belongs_to :user
    end
    change_table :doctors do |t|
      t.string :speciality
      t.belongs_to :user
    end
    change_table :appointments do |t|
      t.datetime :appointment_date
    end
  end
end
