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
    @review.plant.ratings << @review.rating
    authorize @review

    respond_to do |format|
      if @review.save
        format.html { redirect_to plant_path(@review.plant), notice: 'Review successfully added! Thanks!' }
        format.json
      else
        format.html { render :new }
        format.json
      end
    end
  end

  def edit
    @review = Review.find(params[:id])
    authorize @review
  end

  def update
    @review = Review.find(params[:id])
    authorize @review

    if @review.update(review_params)
      redirect_to plant_path(@review.plant), notice: 'Review successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to plant_path(@review.plant), status: :see_other, notice: 'Review successfully deleted!'
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
