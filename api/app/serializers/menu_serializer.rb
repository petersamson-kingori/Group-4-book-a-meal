class MenuSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_one :caterer
  has_many :menu_options
end
