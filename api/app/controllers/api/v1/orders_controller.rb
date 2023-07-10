class Api::V1::OrdersController < ApplicationController
    skip_before_action :authorized, only: [:index, :create]
    def create
      user_id = order_params[:userId]
      items = order_params[:items]
      shipping_location = order_params[:shippingLocation]
    
      # Assuming you have a model called MenuOption
      # Create menu option records for each item in the order
      menu_options = items.map do |item|
        {
          menu_option_id: item[:id],
          name: item[:name],
          price: item[:price]
        }
      end
    
      # Save the order details and associated menu options
      order = Order.new(user_id: user_id, shipping_location: shipping_location)
      order.menu_options.build(menu_options)
    
      if order.save
        render json: { message: 'Order submitted successfully' }, status: :created
      else
        render json: { error: 'Failed to submit order', errors: order.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # Other actions...
  
    private
  
    def order_params
      params.require(:order).permit(:userId, :shippingLocation)
    end
  end
  