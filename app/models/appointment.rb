class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  enum status: { able: 0, disable: 1 }, _suffix: :status
end
