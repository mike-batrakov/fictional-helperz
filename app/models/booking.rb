class Booking < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :listing
  validates :start_date, :end_date, presence: true
  before_validation :start_date_in_future, :dates_has_positive_length

  private

  def start_date_in_future
    return if start_date.blank?
    return if start_date >= Date.current

    errors.add(:start_date, :invalid)
  end

  def dates_has_positive_length
    return if end_date.blank? || start_date.blank?
    return if end_date >= start_date

    errors.add(:end_date, :invalid)
  end
end
