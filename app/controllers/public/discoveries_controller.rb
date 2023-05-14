class Public::DiscoveriesController < ApplicationController
before_action :authenticate_member!
    
  def index
   @discoveries = Discovery.where(is_deleted: false)
  end

  def show
   @discovery = Discovery.find(params[:id])
   @member = @discovery.member
   @review = Review.new
   discoveries = @member.discoveries.pluck(:id)
   @reviews = Review.where(discovery_id: discoveries).where(is_cleared: false)
  end
  
  def search
  @range = params[:range]

  if @range == "member"
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
