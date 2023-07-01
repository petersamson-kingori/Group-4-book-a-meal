class MenuOptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price
  has_one :menu
end
