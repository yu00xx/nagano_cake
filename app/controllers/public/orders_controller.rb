class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end


  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
  end

  def confirm
    @order = Order.new(order_params)
    select_address = params[:order][:select_address]
    if select_address == "0"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name
    elsif select_address == "2"
    end
    @cart_items = current_customer.cart_items.all
    @order.postage = 800
    @total = 0
    #binding.pry
  end

  def create
    @order = Order.new(order_params)
    @order.postage = 800
    @order.customer_id = current_customer.id
    #binding.pry
    @order.save
    cart_items = current_customer.cart_items.all
    cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.amount = cart_item.amount
      @order_detail.tax_included_price = cart_item.item.with_tax_price
      @order_detail.save
    end
    cart_items.destroy_all
    redirect_to complete_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:payment, :shipping_postal_code, :shipping_address, :shipping_name, :billing_amount)
  end
end
