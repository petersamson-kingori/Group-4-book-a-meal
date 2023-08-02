class Api::V1::OrdersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @order = Order.new(user_id: order_params[:userId], email: order_params[:email], shipping_location: order_params[:shippingLocation])
  
    if @order.save
      # Create OrderItems for each item
      order_params[:items].each do |item|
        @order.order_items.create(menu_option_id: item[:id])
      end
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end
    
  

  private

  def order_params
    params.permit(:userId, :email, :shippingLocation, items: [:id, :name, :price])
  end

end
