class BookingsController < ApplicationController
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
    @booking = Booking.find(params[:id])
  end




  private

  def booking_params
    params.require(:booking).permit(:status)
  end
end
