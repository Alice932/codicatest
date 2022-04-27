# frozen_string_literal: true

class AddId < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :patient_id, :integer, default: nil
    add_column :users, :doctor_id, :integer, default: nil
  end
end
