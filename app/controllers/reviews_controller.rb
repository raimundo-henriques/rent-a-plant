class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @review.plant = Plant.find(params[:plant_id])
    @review.user = current_user
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.plant = Plant.find(params[:plant_id])
    @review.user = current_user
    authorize @review

    if @review.save
      redirect_to plant_path(@review.plant), notice: 'Review successfully added! Thanks!'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
