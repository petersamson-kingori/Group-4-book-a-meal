class RemovePriceFromMenus < ActiveRecord::Migration[6.1]
  def change
    remove_column :menus, :price, :integer
  end
end
