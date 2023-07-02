class Menu < ApplicationRecord
  belongs_to :caterer
  has_many :menu_options
end
