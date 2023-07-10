class Api::V1::OrdersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]

  def create
    user_id = params[:userId]
    email = params[:email]
    items = params[:items]
    shipping_location = params[:shippingLocation]

    # Find the user based on the provided user_id
    user = User.find(user_id)

    # Create a new order for the user
    order = user.orders.build(email: email, shipping_location: shipping_location)

    # Save the order to the database
    if order.save
      items.each do |item|
        menu_option_id = item[:id]

        # Find the menu option based on the provided item ID
        menu_option = MenuOption.find_by(id: menu_option_id)

        if menu_option
          # Create an order item for the menu option
          order_item = order.order_items.build(menu_option: menu_option, name: item[:name], price: item[:price])
          order_item.save
        else
          # Handle case when menu option is not found
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
