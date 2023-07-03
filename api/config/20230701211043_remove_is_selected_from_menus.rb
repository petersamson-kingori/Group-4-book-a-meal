class RemoveIsSelectedFromMenus < ActiveRecord::Migration[6.1]
  def change
    remove_column :menus, :isSelected, :boolean
  end
end
