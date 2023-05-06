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
  end

  def update
  end

private
 def genres_params
  params.require(:genre).permit(:name)
 end

end
