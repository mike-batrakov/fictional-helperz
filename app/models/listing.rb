class Listing < ApplicationRecord
  # Associations
  belongs_to :user
  # has_many :bookings, dependant: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
