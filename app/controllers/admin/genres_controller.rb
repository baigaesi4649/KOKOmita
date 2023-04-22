class Admin::GenresController < ApplicationController
    
  def create
       @genre=Genre.new(genre_params)
    if @genre.save
      #flash[:notice] = "You have updated user successfully."
      redirect_to admin_genres_path
    end
  end
  
  def index
   @genres=Genre.all
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    #flash[:notice] = "You have updated user successfully."
    redirect_to admin_genres_path
    end
  end

private
def genre_params
 params.require(:genre).permit(:genre_name)
end
end
