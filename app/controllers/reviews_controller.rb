class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(strong_params_review)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.save
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render 'new'
    end
  end

  private

  def strong_params_review
    params.require(:review).permit(:content, :resteraunt, :rating)
  end
end
