class Admin::OrderDetailsController < ApplicationController
  def update
   # @order = Order.find(params[:order_id]) #外部キーでの呼び出しの記述
   @order_item = OrderItem.find(params[:id])
   if @order_item.update(order_item_params)
    flash[:notice]="製作ステータスを更新しました。"
    redirect_to admin_order_path(@order_item.order.id)
   else
    render :edit
   end
  end


  private
  def order_item_params
   params.require(:order_item).permit(:confectionary_status)
  end
end
