class Admin::HomesController < ApplicationController

  def top
    @order_all = OrderDetail.page(params[:page]).per(10)
    @orders = Order.all
    @customer = @order.customer.id
  end


end
