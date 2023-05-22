class Public::CartItemsController < ApplicationController
  def index
   @cart_items=CartItem.all
   @cart_item=CartItem.find(params[:id])
  end

  def update
   @cart_item=CartItem.find(params[:id])
   @Cart_item.update(cart_item_params)
   redirect_to cart_items_path
  end

  def destroy
   @cart_items=CartItem.find(params[:id])
   @cart_items.destroy
   redirect_to cart_items_path
  end

  def delete_all
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
