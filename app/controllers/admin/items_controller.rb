class Admin::ItemsController < ApplicationController
  def index
   @items=Item.all
   @items=Item.page(params[:page])
  end

  def new
   @item=Item.new
  end

  def create
   @item=Item.new(item_params)
   if @item.save
    redirect_to admin_items_path
   else
    render :new
   end
  end

  def show
   @item=Item.find(params[:id])
  end

  def edit
   @item=Item.find(params[:id])
  end

  def update
   @item=Item.find(params[:id])
   if @item.update(item_params)
    flash[:notice]="商品情報の編集が完了しました。"
    redirect_to admin_items_path
   else
    @item=Item.all
    render :edit
   end
  end

  private
   def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :image, :is_active)
   end
end
