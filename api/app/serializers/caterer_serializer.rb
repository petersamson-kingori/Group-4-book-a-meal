class CatererSerializer < ActiveModel::Serializer
  attributes :id, :username, :business_name
  has_many :menus, include_nested_association: true
  
  def include_menus?
    object.menus.present?
  end

  def menus
    object.menus.map do |menu|
      {
        id: menu.id,
        name: menu.name,
        description: menu.description,
        menu_options: menu.menu_options
      }
    end
  end
  
end


