class Listing < ApplicationRecord
  # Associations
  has_many :listings, through: :bookings
  has_many :bookings, dependant: :destroy
end
