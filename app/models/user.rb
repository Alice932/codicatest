# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { patient: 0, doctor: 1, admin: 2 }, _suffix: :role
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, authentication_keys: [:login]
  validates :phone, uniqueness: true
  validates :username, uniqueness: true
  def login=(_login)
    @login = email
  end

  def login
    @login || phone || email
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(phone) ILIKE '%#{login.downcase}%' OR lower(email) = :value",
                                       { value: login.downcase }]).first
    elsif conditions.key?(:phone) || conditions.key?(:email)
      where(conditions.to_hash).first
    end
  end
end
