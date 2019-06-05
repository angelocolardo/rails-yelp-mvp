class ReviewsController < ApplicationController
 before_action :set_reviews, only: [:show, :edit, :update, :destroy]

def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurant_path(@review)
    else
      render :new
    end
  end

  def update
    @review.update(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating )
  end

  def set_reviews
    @review = Review.find(params[:id])
  end
end
