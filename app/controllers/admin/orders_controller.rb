class Admin::OrdersController < ApplicationController
  def show
   @order=Order.find(params[:id])
   @total=0
  end

  def update
  end

  private
  def order_params
   params.require(:order).permit(:confectionary_status)
  end
end
