class User < ApplicationRecord
  enum role: { patient: 0, doctor: 1, admin: 2 }, _suffix: :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:email]

end
