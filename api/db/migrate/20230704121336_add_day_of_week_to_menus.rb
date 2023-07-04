class AddDayOfWeekToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :day_of_week, :integer
  end
end
