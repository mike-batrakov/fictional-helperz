class Listing < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
end
