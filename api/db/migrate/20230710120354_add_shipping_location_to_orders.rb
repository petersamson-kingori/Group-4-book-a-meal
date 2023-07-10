class AddShippingLocationToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :shipping_location, :string
  end
end
