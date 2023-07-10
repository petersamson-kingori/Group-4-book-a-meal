class Menu < ApplicationRecord
  has_many :menu_options, dependent: :destroy
  belongs_to :caterer
  has_many :orders
  

  
end
