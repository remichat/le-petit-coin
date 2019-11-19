class Booking < ApplicationRecord
  STATUSES = %w[Pending Confirmed Rejected]
  belongs_to :toilet
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validates :status, inclusion: { in: STATUSES }
end
