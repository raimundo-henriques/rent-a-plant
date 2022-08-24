class Plant < ApplicationRecord
  validates :common_name, :latin_name, presence: true
  validates :difficulty_level, inclusion: { in: (1..10) }

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_one_attached :photo

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model

  pg_search_scope :search_by_common_and_latin_name,
  against: [ :common_name, :latin_name ],
  associated_against: {
    user: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
