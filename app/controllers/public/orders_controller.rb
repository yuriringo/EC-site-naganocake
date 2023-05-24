class Public::OrdersController < ApplicationController
  def new
   @addresses=Address.where(customer_id: current_customer.id)
   @customer=current_customer
   @order=Order.new
  end

  def check
   @order=Order.new[order_params]
   @cart_items=current_customer.cart_items

   if params[:order][:address_options]==0
    @order.address=current_customer.address
   elsif params[:order][:address_options]==1
    @order.delivery_address=DeliveryAddress.find(params[:orders][:delivery_address]).address #この行から怪しい
   elsif params[:order][:address_options]==2
    render :new
   end

  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private
  def order_params
   params.require(:orders).permit(:payment_options, :address, :postal_code, :name)
  end
end
