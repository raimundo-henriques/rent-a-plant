class BookingsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.new
    @booking.plant = Plant.find(params[:plant_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.plant = Plant.find(params[:plant_id])
    authorize @booking
    if @booking.save
      redirect_to plant_path(@booking.plant), notice: 'Booking was successfully.'
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

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
