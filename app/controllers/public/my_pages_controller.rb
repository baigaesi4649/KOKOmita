class Public::MyPagesController < ApplicationController
    
  def index
   @member = current_member
  end
  
  def create
   @discovery = Discovery.new(discoveries_params)
   @discovery.member_id = current_member.id
   genre_id = Genre.find_by(genre_name: params[:discovery][:genre_id]).id
   Discovery.create(discoveries_params.merge(genre_id: genre_id))
   if @discovery.save
   #flash[:notice] = "You have created book successfully."
   redirect_to public_my_pages_show_path(current_member.id)
   end
  end
  
  def show
    @discovery = Discovery.find(params[:id])
  end
  
  def update
   @member = current_member
   if @member.update(members_params)
   #flash[:notice] = "You have updated user successfully."
   redirect_to  public_my_pages_path
   end
  end
  
  private
  def members_params
   params.require(:member).permit(:name, :user_name, :email)
   #params.require(:discovery).permit(:member_id,:genre_id,:title,:explanation,:is_deleted)
  end
  def discoveries_params
   params.permit(:member_id, :genre_id, :title, :explanation, :is_deleted, :image1, :image2, :genre_name)
   #params.require(:discovery).permit(:member_id,:genre_id,:title,:explanation,:is_deleted)
  end
end
