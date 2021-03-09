class BookingsController < ApplicationController
  before_action :bookings, only: [:update, :destroy]

  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    @booking.save
    redirect_to bookings_path
  end

  def update
    @booking.status = params[:status]
    @booking.save!
    redirect_to listings_path
  end

  def destroy
    @booking.destroy
    redirect_to listings_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end
  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
