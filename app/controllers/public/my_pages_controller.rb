class Public::MyPagesController < ApplicationController
    
  def index
    @member = current_member
    @discovery = Discovery.new
    @discoveries = current_member.discoveries
  end
  
  def create
    @discovery = Discovery.new(discoveries_params)
    @discovery.member_id = current_member.id
    #genre_id = Genre.find_by(genre_name: params[:discovery][:genre_id]).id
    #Discovery.create(discoveries_params.merge(genre_id: genre_id))
   if @discovery.save
     #flash[:notice] = "You have created book successfully."
     redirect_to public_my_pages_show_path(@discovery.id)
   else
     @member = current_member
     render :index
   end
  end
  
  def show
    @discovery = Discovery.find(params[:id])
    @reviews = @discovery.reviews.where(is_cleared: false)
  end
  
  def update
   @member = current_member
   if @member.update(members_params)
   #flash[:notice] = "You have updated user successfully."
   redirect_to  public_my_pages_path
   end
  end
  
  
  def withdraw
   @member = current_member
   @member.update(is_cancelled: true)
   reset_session
   redirect_to root_path
  end  
  
  def renew
   @discovery = Discovery.find(params[:id])
   if @discovery.update(discoveries_params)
   #flash[:notice] = "You have updated user successfully."
   redirect_to  public_my_pages_path
   end
  end
  
  def destroy
    discovery = Discovery.find(params[:id])
    discovery.destroy
    redirect_to public_my_pages_path
  end
  
  private
  def members_params
   params.require(:member).permit(:name, :user_name, :email)
   #params.require(:discovery).permit(:member_id,:genre_id,:title,:explanation,:is_deleted)
  end
  def discoveries_params
   params.require(:discovery).permit(:member_id, :genre_id, :title, :explanation, :is_deleted, :image1, :image2)
   #params.require(:discovery).permit(:member_id,:genre_id,:title,:explanation,:is_deleted)
  end
end
