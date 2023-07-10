class User < ApplicationRecord
  has_secure_password

  has_many :reviews
  has_many :orders
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: true
end
