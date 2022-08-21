class Plant < ApplicationRecord
  validates :common_name, :latin_name, presence: true
  validates :difficulty_level, inclusion: { in: (1..10) }

  belongs_to :user
  has_many :reviews, dependent: :destroy

  has_one_attached :photo
end
