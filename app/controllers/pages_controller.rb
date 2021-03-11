class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @listings = current_user.listings
    @bookings = current_user.bookings.order(start_date: :desc)
    @requests = Booking.all
  end
end
