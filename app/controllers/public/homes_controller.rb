class Public::HomesController < ApplicationController

  def top
    @item  = Item.all.order("created_at DESC").limit(4)
  end

  def about
  end

end
