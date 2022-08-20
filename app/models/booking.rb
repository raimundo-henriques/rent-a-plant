class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  validates :end_date, comparison: { greater_than: :start_date }
  validates :start_date, :end_date, presence: true
end
