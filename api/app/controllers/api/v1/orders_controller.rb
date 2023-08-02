class Api::V1::OrdersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @order = Order.new(user_id: order_params[:userId], email: order_params[:email], shipping_location: order_params[:shippingLocation])

    begin
      Order.transaction do 
        @order.save!

        # Create OrderItems for each item
        params[:items].each do |item|
          if MenuOption.exists?(item[:id])
            @order.order_items.create!(menu_option_id: item[:id])
          else
            render json: { error: "Menu option with id #{item[:id]} not found" }, status: :unprocessable_entity and return
          end
        end
      end

      render json: @order, status: :created, location: @order
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors }, status: :unprocessable_entity
    end
  end
  
  private

  def order_params
    params.permit(:userId, :email, :shippingLocation, items: [:id])
  end
end
