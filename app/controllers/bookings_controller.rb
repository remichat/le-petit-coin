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
    @toilet = Toilet.find(params[:toilet_id])
    @booking.toilet = @toilet
    # if
    @toilet.save
    # redirect_to toilet_path(@toilet)
    # else
    #   render :new
    # end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
