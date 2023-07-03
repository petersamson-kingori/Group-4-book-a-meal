class User < ApplicationRecord
  has_secure_password

  has_many :reviews
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: true
end
