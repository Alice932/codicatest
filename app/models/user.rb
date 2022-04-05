class User < ApplicationRecord
  enum role: { patient: 0, doctor: 1, admin: 2 }, _suffix: :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  attr_writer :login

  def login
    @login || self.username || self.email || self.phone
  end
end
