class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @toilet = Toilet.find(params[:toilet_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @toilet = Toilet.find(params[:toilet_id])
    @booking.toilet = @toilet
    @booking.save
    redirect_to bookings_path(@toilet)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
