class Public::ReviewsController < ApplicationController
  def create
    @review = Review.new(reviews_params)
    @review.member_id = current_member.id
    #genre_id = Genre.find_by(genre_name: params[:discovery][:genre_id]).id
    #Discovery.create(discoveries_params.merge(genre_id: genre_id))
   if @review.save!
     #flash[:notice] = "You have created book successfully."
     redirect_to public_discoveries_path(@review.id)
   else
     @member = current_member
     render :index
   end
  end
  
private
  def reviews_params
   params.require(:review).permit(:member_id, :discovery_id, :review_score,:comment,:is_cleared)
   #params.require(:discovery).permit(:member_id,:genre_id,:title,:explanation,:is_deleted)
  end
end
