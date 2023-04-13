class Public::MyPagesController < ApplicationController
    
  def index
   @member = current_member
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
   params.require(:member).permit(:member_id,:genre_id,:title,:explanation,:is_deleted)
  end
end
