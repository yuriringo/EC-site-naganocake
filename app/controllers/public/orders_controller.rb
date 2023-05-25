class Public::OrdersController < ApplicationController
  def new
   @addresses=Address.where(customer_id: current_customer.id)
   @customer=current_customer
   @order=Order.new
  end

  def check
   @order=Order.new(order_params)
   @cart_items=current_customer.cart_items

   if params[:order][:address_options]==0
    @order.address=current_customer.postal_code
    @order.address=current_customer.address
    @order.address=current_customer.name

   elsif params[:order][:address_options]==1
    @order.address=DeliveryAddress.find(params[:order][:delivery_address]).postal_code
    @order.address=DeliveryAddress.find(params[:order][:delivery_address]).address
    @order.address=DeliveryAddress.find(params[:order][:delivery_address]).name

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
   params.require(:order).permit(:payment_options, :address, :postal_code, :name)
  end
end
