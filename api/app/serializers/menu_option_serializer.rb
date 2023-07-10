class MenuOptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :imageUrl
  has_one :menu
end
