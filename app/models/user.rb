class User < ApplicationRecord
  require 'securerandom'

  has_secure_password

  has_many :bookings
  has_many :hotels

  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true, length: { in: 1..250 }
end
