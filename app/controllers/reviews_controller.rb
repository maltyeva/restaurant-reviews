class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    # get data from form
    @review = Review.new(review_params)
    #assign restaurant to review
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
    @restaurant = @review.restaurant
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end


  private
  def review_params
    params.require(:review).permit(:content)
  end

end
