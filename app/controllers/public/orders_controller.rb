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
   @cart_items=current_customer.cart_items
   @order=Order.new(order_params)
   @order.customer_id=current_customer.id
   @order.save
   @cart_items.each do |cart_item|
    order_item=OrderItem.new
    #以下に保存したい内容を記述。ER図の注文商品テーブルの商品IDから税込み購入時価格までの4つの情報を記述。
    order_item.item_id=cart_item.item_id
    order_item.order_id=@order.id #中間テーブルの記述
    order_item.amount=cart_item.amount
    order_item.purchase_price=cart_item.item.price
    order_item.confectionary_status=cart_item.item.is_active

    order_item.save
   end
   @cart_items.destroy_all
   redirect_to orders_complete_path
  end

  def index
   @orders=Order.all
   @total=0
  end

  def show
  end

  private
  def order_params
   params.require(:order).permit(:payment_method, :address, :postal_code, :name, :total, :postage)
  end

end
