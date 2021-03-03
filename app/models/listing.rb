class Listing < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :category
  # has_many :reviews, dependant: :destroy
  # has_many :bookings, dependant: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
