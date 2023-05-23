class Public::CartItemsController < ApplicationController
  def index
   @cart_items=CartItem.all
   @total=@cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def update
   @cart_items=CartItem.find(params[:id])
   @cart_items.update(cart_item_params)
   redirect_to cart_items_path
  end

  def destroy
   @cart_items=CartItem.find(params[:id])
   @cart_items.destroy
   redirect_to cart_items_path
  end

  def delete_all
   @cart_items=CartItem.where(customer_id: current_customer.id)
   @cart_items.destroy_all
   redirect_to cart_items_path
  end

  def create
   @cart_item=CartItem.new(cart_item_params)
   @cart_item.customer_id=current_customer.id
   @cart_item.save
   redirect_to cart_items_path
  end

  private
  def cart_item_params
   params.require(:cart_item).permit(:item_id, :amount, :image)
  end
end
