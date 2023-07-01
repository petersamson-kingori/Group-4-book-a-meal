class MenuSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :isSelected
  has_one :caterer
end
