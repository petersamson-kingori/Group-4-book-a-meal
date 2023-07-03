class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.references :caterer, null: false, foreign_key: true
      t.string :name
      t.text :description
  

      t.timestamps
    end
  end
end
