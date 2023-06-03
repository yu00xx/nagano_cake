class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    binding.pry
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :shipping_postal_code, :shipping_address, :shipping_name)
  end
end
