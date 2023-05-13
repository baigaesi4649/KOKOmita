class Admin::DiscoveriesController < ApplicationController
before_action :authenticate_admin!

  def index
    @discoveries = Discovery.all
  end
  
  def edit
    @discovery = Discovery.find(params[:id])
  end
  
  def update
    @discovery = Discovery.find(params[:id])
    if @discovery.update(discoveries_params)
    #flash[:notice] = "You have updated user successfully."
    redirect_to  admin_discoveries_path
    end
  end
  
  private
  
  def discoveries_params
   params.require(:discovery).permit(:member_id, :genre_id, :title, :explanation, :is_deleted, :image1, :image2, :genre_name)
  end
  
end
