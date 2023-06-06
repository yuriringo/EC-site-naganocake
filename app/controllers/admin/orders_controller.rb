class Admin::OrdersController < ApplicationController
  def show
   @order=Order.find(params[:id])
  end

  def update
  end

  private
  def order_params
   params.require(:order).permit(:name, :updated_at, :postal_code, :address, :payment_method, :total, :postage, :confectionary_status)
  end
end
