class Booking < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :listing
  has_many :reviews
end
