class Admin::MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end
  
  def update
   @member = Member.find(params[:id])
   if @member.update(members_params)
   #flash[:notice] = "You have updated user successfully."
   redirect_to  admin_members_path
   end
  end

  private
  def member_params
   params.require(:member).permit(:id,:name,:user_name,:email,:encrypted_password,:is_cancelled)
  end
  
end
