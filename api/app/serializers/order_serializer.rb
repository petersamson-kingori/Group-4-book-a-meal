class OrderSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :menu_option
end
