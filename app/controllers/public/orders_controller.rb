class Public::OrdersController < ApplicationController
  def new
   @addresses=Address.where(customer_id: current_customer.id)
   @customer=current_customer
   @order=Order.new
  end

  def check
   @order=Order.new(order_params)
   @cart_items=current_customer.cart_items
   @total=0

   #if params[:order][:payment_options]=="credit_card"
    #@order.payment_options="credit_card"

   #else

   #end
  #byebug

   if params[:order][:address_options]=="0"
    @order.postal_code=current_customer.postal_code
    @order.address=current_customer.address
    @order.name=current_customer.last_name+current_customer.first_name

   elsif params[:order][:address_options]=="1"
    @order.postal_code=Address.find(params[:order][:address_id]).postal_code
    #上記、カッコが2つあるのは、paramsという親要素からは孫要素である:address_idは直接呼び出せないから。子要素である:orderを呼び出してから孫を呼ばないと呼べない。
    @order.address=Address.find(params[:order][:address_id]).delivery_address
    @order.name=Address.find(params[:order][:address_id]).name

   elsif params[:order][:address_options]=="2"

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
   params.require(:order).permit(:payment_method, :address, :postal_code, :name)
  end

end
