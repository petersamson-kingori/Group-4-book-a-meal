class CreateMenuOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_options do |t|
      t.references :menu, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
