class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.status = true
  end

  def edit
  end

  def create
    @booking = Booking.new(rental_params)
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
    @rental = Booking.find(params[:id])
    @rental.destroy
    redirect_to listings_path
  end

  private

  def rental_params
    params.require(:rental).permit(:status)
  end
end
