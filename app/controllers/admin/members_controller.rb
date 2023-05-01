class Admin::MembersController < ApplicationController

  def index
    @members = Member.all
    #@member = Member.find(params[:id])
    #@average = @member.reviews.sum(0.0)/reviews.length
  end

  def edit
    @member = Member.find(params[:id])
  end
  
  def update
   @member = Member.find(params[:id])
   if @member.update(member_params)
   #flash[:notice] = "You have updated user successfully."
   redirect_to  admin_members_path
   end
  end

  private
  def member_params
   params.require(:member).permit(:name,:user_name,:email,:encrypted_password,:is_cancelled)
  end
  
end
