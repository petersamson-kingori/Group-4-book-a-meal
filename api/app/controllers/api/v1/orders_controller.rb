class Api::V1::OrdersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]

  def create
    order_params = params[:order]
    user_id = order_params[:userId]
    email = order_params[:email]
    items = order_params[:items]
    shipping_location = order_params[:shippingLocation]
  
    # Find the user based on the provided user_id
    user = User.find_by(id: user_id)
  
    if user.nil?
      render json: { error: "User with ID #{user_id} not found" }, status: :unprocessable_entity
      return
    end
  
    # Create a new order for the user
    order = user.orders.build(email: email, shipping_location: shipping_location)
  
    # Save the order to the database
    if order.save
      items.each do |item|
        menu_option_id = item[:id]
        menu_option = MenuOption.find_by(id: menu_option_id)
  
        if menu_option
          # Create an order item for the menu option
          order_item = order.order_items.build(menu_option_id: menu_option.id, name: menu_option.name, price: menu_option.price)
          order_item.save
        else
          # Handle the case when the menu option is not found
          render json: { error: "Menu option with ID #{menu_option_id} not found" }, status: :unprocessable_entity
          return
        end
      end
  
      # Send a confirmation to the user or caterer
      # ...
  
      render json: { message: 'Order submitted successfully' }, status: :created
    else
      render json: { error: 'Failed to submit order', errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  # Other actions...

  private

  def order_params
    params.permit(:userId, :email, :shippingLocation, items: [:id, :name, :price])
  end
end
