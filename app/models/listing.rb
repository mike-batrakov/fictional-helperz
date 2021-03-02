class Listing < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :category
  has_many :reviews, through: :bookings
  has_many :bookings, dependant: :destroy
end
