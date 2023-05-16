class Public::ItemsController < ApplicationController
  def index
   @items=Item.all
  end

  def show
   @item=Item.find(params[:id])
  end

  def item_params
   params.require(:item).permit(:name, :introduction, :price, :genre_id, :image, :is_active)
  end
end
