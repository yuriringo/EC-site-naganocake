class Admin::ItemsController < ApplicationController
  def index
   @items=Item.all
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
  end

  def edit
  end

  def update
   @item=Item.find(params[:id])
   if @item.update(item_params)
    flash[:notice]="商品の新規登録が完了しました。"
    redirect_to admin_items_path(@book.id)
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
