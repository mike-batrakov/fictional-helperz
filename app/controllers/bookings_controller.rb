class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def gstclassnew
    @booking = Booking.new
  end

  def create
  end

  def show
  end

  def update
  end
end
