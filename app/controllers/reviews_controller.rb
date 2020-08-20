class ReviewsController < ApplicationController
  def create
    @review = Review.new(strong_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @review = Review.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def index
    @reviews = Review.all
  end

  def destroy
    @review = review.find(params[:id])
    @review.destroy
    redirect_to cocktail_path(@review.cocktail)
  end

  private

  def strong_params
    params.require(:review).permit(:description)
  end
end
