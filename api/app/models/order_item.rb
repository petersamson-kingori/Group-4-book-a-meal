class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_option
end
