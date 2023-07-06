class AddDayToMenuOptions < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_options, :day, :string
  end
end
