# frozen_string_literal: true

class EditAppointmentTable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :appointments, :recomendation, false
    change_column_default :appointments, :recomendation, from: nil, to: ''
    add_column :appointments, :status, :integer, default: 0
  end
end
