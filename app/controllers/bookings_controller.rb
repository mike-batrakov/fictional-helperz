class BookingsController < ApplicationController


  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new

  end

  def create
    @booking = Booking.new(booking_params)

    @listing = Listing.find

  end

  private

  def booking_params
    params.require
  end

end
