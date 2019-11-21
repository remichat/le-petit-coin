class Toilet < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  GENDERS = %w[Homme Femme Mixte]
  GENDERS_ICONS = {
    "Homme" => "<i class='fas fa-mars'></i>".html_safe,
    "Femme" => "<i class='fas fa-venus'></i>".html_safe,
    "Mixte" => "<i class='fas fa-venus'></i><i class='fas fa-mars'></i>".html_safe
  }
  TOILET_TYPES = %w[Turc Sèche Pot]

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  # validates :title, :description, :address, :toilet_type, :capacity, :gender, presence: true
  validates :gender, inclusion: { in: GENDERS }
  validates :toilet_type, inclusion: { in: TOILET_TYPES }

  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def finished?
    toilet_type.present? && description.present?
  end
end
