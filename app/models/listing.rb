class Listing < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :bookings, dependant: :destroy
end
