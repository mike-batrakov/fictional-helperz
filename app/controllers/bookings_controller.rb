class BookingsController < ApplicationController
  before_action :set_bookings, only: %i[edit, update]
  def new
    # @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.listing = Listing.find(params[:listing_id])
    @booking.user = current_user

    if @booking.save
      redirect_to listing_path(@listing)
    else
      render :new_listing_booking
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  private

  def set_bookings
    @booking = Booking.params([:id])
  end

  def booking_params
    params.require(:booking).permit(:status)
  end
end
