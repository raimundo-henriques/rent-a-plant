class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(:start_date)
  end

  def new
    @booking = Booking.new
    @plant = Plant.find(params[:plant_id])
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
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: 'Booking was successfully update.'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
