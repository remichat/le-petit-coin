class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings, dependent: :destroy
  has_many :toilets
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :phone_number, :address, presence: true
  validates :phone_number, uniqueness: true, format: { with: /\d{8,10}/,
    message: "should be a valid phone number modafoka" }

  def number_of_notifications
    bookings = find_bookings_from_toilet(toilets)
    bookings.reduce(0) do |memo, booking|
      increment = booking.is_read ? 0 : 1
      memo + increment
    end
  end

  private

  def find_bookings_from_toilet(toilets)
    bookings = []
    toilets.each { |toilet| bookings << toilet.bookings }
    bookings.flatten
  end
end
