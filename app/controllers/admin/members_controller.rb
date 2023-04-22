class Admin::MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def show
   @item=Item.find(params[:id])
   @cart_item=CartItem.new
  end

  private
  def item_params
   params.require(:member).permit(:name,:user_name,:email,:encrypted_password,:is_cancelled)
  end
  
end
