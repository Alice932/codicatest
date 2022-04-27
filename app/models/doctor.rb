# frozen_string_literal: true

class Doctor < ApplicationRecord
  SPECIALITY = %w[Endocrinologist Neurologist Psychiatrist].freeze
  has_many :appointments
  has_many :patients, through: :appointments
  validates :email, uniqueness: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
