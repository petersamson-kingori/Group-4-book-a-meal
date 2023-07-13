class Api::V1::OrdersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    order = Order.new(order_params)

    if order.save
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
    params.permit(:userId, :email, :shippingLocation, items: [:name, :price]).tap do |whitelisted|
      user = User.find(params[:userId])
      whitelisted[:user_id] = user.id
      whitelisted[:email] = params[:email]
      whitelisted[:shipping_location] = params[:shippingLocation]
      whitelisted[:order_items_attributes] = params[:items].map do |item|
        { name: item[:name], price: item[:price] }
      end
    end
  end
end
