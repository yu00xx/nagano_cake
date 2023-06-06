class Admin::HomesController < ApplicationController

  def top
    @order_all = Order.page(params[:page]).per(10)
    #binding.pry
  end


end
