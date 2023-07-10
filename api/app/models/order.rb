class Order < ApplicationRecord
  belongs_to :user
  belongs_to :menu_option

  validates :email, presence: true
end
