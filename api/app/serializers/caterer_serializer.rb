class CatererSerializer < ActiveModel::Serializer
  attributes :id, :username, :business_name
  has_many :menus, include_nested_association: true
end
