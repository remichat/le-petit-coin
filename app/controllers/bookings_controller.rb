class BookingsController < ApplicationController
  def index
    @page_title = "booking_index"
    @bookings = Booking.where(user: current_user)
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

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
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
    bookings = find_bookings_from_toilet(user.toilets)
    number = bookings.reduce(0) do |memo, booking|
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

  def find_bookings_from_toilet(toilets)
    bookings = []
    toilets.each { |toilet| bookings << toilet.bookings }
    bookings.flatten
  end
end
