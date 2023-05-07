class Admin::GenresController < ApplicationController
  def index
   @genre=Genre.all
  end

  def create
   @genre=Genre.new(genres_params)
   @genre.save
   redirect_to admin_genres_path
  end

  def edit
   @genre=Genre.find(params[:id])
  end

  def update
   @genre=Genre.find(params[:id])
   if @genre.update(genres_params)
    flash[:notice]="ジャンルの編集が完了しました。"
    redirect_to admin_genres_path(@genre.id)
   else
    @genres=Genre.all
    render :edit
   end
  end

private
 def genres_params
  params.require(:genre).permit(:name)
 end

end
