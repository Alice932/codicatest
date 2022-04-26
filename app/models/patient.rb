class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments
  # belongs_to :user, class_name: "user", foreign_key: "user_id"
end
