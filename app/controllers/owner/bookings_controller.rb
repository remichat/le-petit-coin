class Owner::BookingsController < ApplicationController
  def index
    toilets = Toilet.where(user: current_user)
    @bookings = find_bookings_from_toilet(toilets)
    @bookings.map { |booking| booking.update(is_read: true) }
  end

  def find_bookings_from_toilet(toilets)
    bookings = []
    toilets.each { |toilet| bookings << toilet.bookings }
    bookings.flatten
  end
end
