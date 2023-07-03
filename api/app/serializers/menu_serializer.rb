class MenuSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_one :caterer
end
