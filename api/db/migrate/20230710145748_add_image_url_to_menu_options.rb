class AddImageUrlToMenuOptions < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_options, :imageUrl, :string
  end
end
