class Owner::BookingsController < ApplicationController
  def index
    toilets = Toilet.where(user: current_user)
    @bookings = find_bookings_from_toilet(toilets).reverse
    render :index
    @bookings.map { |booking| booking.update(is_read: true) }
    @page_title = "owner_index"
  end

  def find_bookings_from_toilet(toilets)
    bookings = []
    toilets.each { |toilet| bookings << toilet.bookings }
    bookings.flatten
  end
end
