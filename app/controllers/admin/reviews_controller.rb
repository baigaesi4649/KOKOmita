class Admin::ReviewsController < ApplicationController
before_action :authenticate_admin!
  
  def index
    @reviews = Review.all
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(reviews_params)
    #flash[:notice] = "You have updated user successfully."
    redirect_to  admin_reviews_path
    end
  end

  private
  
  def reviews_params
   params.require(:review).permit(:member_id, :discovery_id, :review_score, :comment, :is_cleared)
  end
  
end
