class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_many :bookings, dependent: :destroy
  has_many :toilets
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :phone_number, :address, presence: true
  validates :phone_number, uniqueness: true, format: { with: /\d{8,10}/,
    message: "should be a valid phone number modafoka" }

  def number_of_notifications
    self.bookings.reduce(0) do |memo, booking|
      increment = booking.is_read ? 1 : 0
      memo + increment
    end
  end
end
