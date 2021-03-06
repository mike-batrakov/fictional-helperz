class BookingsController < ApplicationController
  def new
    @bookings = Booking.new
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.listing = Listing.find(params[:listing_id])
    @booking.user = current_user
    @booking.status = true
    @booking.save

    redirect_to listings_path
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    @booking.save!
    redirect_to listings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to listings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:status)
  end
end
