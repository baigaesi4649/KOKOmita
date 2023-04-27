class Public::DiscoveriesController < ApplicationController
    
  def index
   @discoveries = Discovery.all
  end

  def show
   @member = current_member
   @discovery = Discovery.find(params[:id])
   @review = Review.new
  end
  
  def search
  @range = params[:range]

  if @range == "Member"
    @members = Member.looks(params[:search], params[:word])
  else
    @discoveries = Discovery.looks(params[:search], params[:word])
  end
   #@discoveries = Discovery.where('title LIKE ?', "%#{params[:keyword]}%")
  end

  private
  
  def discoveries_params
   params.require(:review).permit(:member_id, :genre_id, :title, :explanation, :is_deleted, :image1, :image2, :genre_name)
  end
  
end    
