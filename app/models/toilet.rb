class Toilet < ApplicationRecord
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

  def finished?
    toilet_type.present? && description.present?
  end
end
