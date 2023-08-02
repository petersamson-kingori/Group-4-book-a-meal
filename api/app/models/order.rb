class Order < ApplicationRecord
  belongs_to :user
  belongs_to :menu_option
  has_many :order_items


end
