class Toilet < ApplicationRecord
  GENDERS = %w[Homme Femme Mixte]
  TOILET_TYPES = %w[Turc Sèche Pot]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :title, :description, :address, :toilet_type, :capacity, :gender, presence: true
  validates :gender, inclusion: { in: GENDERS }
  validates :toilet_type, inclusion: { in: TOILET_TYPES }
end
