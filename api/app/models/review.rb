class Review < ApplicationRecord
  belongs_to :caterer
  belongs_to :user
end
