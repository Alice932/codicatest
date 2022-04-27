class Doctor < ApplicationRecord
  SPECIALITY = %w[Endocrinologist Neurologist Psychiatrist]
  has_many :appointments
  has_many :patients, through: :appointments
end
