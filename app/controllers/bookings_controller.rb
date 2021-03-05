class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new

  end

  def create
    @booking =

  end

  def show
  end

  def update
  end
end
