class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    # get info from form
    @review = Review.new(review_params)
    # read restaurant id from url
    # @restaurant = Restaurant.find(params[:restaurant_id])
    # assign restaurant on backend
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])

  end

  def review_params
    params.require(:review).permit(:content)
  end

end
