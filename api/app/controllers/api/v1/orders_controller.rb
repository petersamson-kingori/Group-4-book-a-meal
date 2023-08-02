class Api::V1::OrdersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @order = current_user.orders.build(order_params)

    # Rest of the code to create order items

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: { errors: @order.errors }, status: :unprocessable_entity
    end
  end
    
  

  private

def order_params
  params.require(:order).permit(:userId, :email, :shippingLocation, items: [:id])
end

end
