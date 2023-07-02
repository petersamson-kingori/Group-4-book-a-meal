class ReviewSerializer < ActiveModel::Serializer
  attributes :id
  has_one :caterer
  has_one :user
end
