class Api::V1::OrdersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @order = Order.new(order_params.except(:items))
  
    if @order.save
      # Create OrderItems for each item
      params[:items].each do |item|
        @order.order_items.create(menu_option_id: item[:id])
      end
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end
  
    
  

  private

def order_params
  params.require(:order).permit(:userId, :email, :shippingLocation, items: [:id])
end

end
