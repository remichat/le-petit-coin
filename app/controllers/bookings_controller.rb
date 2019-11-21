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
    redirect_to bookings_path
  end

  def accept
    change_status("Confirmed")
  end

  def reject
    change_status("Rejected")
  end

  def number_of_notifications_for_user
    user = User.find(params[:user_id])
    number = user.bookings.reduce(0) do |memo, booking|
      increment = booking.is_read ? 0 : 1
      memo + increment
    end
    render json: { notifications: number }
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def change_status(new_status)
    @booking = Booking.find(params[:id])
    @booking.status = new_status
    @booking.save
    redirect_to owner_bookings_path
  end
end
