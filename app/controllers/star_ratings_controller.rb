class StarRatingsController < ApplicationController
  def create
    @rating = current_user.star_ratings.build rating_params
    if @rating.save
      flash[:success] = t "ratings.success"
    else
      flash[:danger] = t "ratings.already"
    end
    redirect_to request.referer
  end
  
  private

  def rating_params
    params.require(:star_rating).permit :user_id, :exam_id, :rating
  end

end
