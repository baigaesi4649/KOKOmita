class Public::DiscoveriesController < ApplicationController
    
  def index
   @discoveries = Discovery.all
  end

  def show
   @member = Member.find(params[:id])
   @review = Review.new
  end
  
  def search
   @discoveries = Discovery.where('title LIKE ?', "%#{params[:keyword]}%")
  end

  private
  
  def discoveries_params
   params.require(:review).permit(:member_id, :genre_id, :title, :explanation, :is_deleted, :image1, :image2, :genre_name)
  end
  
end    
