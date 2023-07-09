class Api::V1::OrdersController < ApplicationController
    skip_before_action :authorized, only: [:index, :create]
    def create
      user_id = params[:userId]
      items = params[:items]
      shipping_location = params[:shippingLocation]
  
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
      if Order.create(user_id: user_id, shipping_location: shipping_location, menu_options: menu_options)
        render json: { message: 'Order submitted successfully' }, status: :created
      else
        render json: { error: 'Failed to submit order' }, status: :unprocessable_entity
      end
    end
  
    def index
      orders = Order.all
      render json: orders
    end
  
    private
  
    def order_params
      params.permit(:userId, items: [:id, :name, :price], :shippingLocation)
    end
  end
  