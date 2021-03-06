class BookingsController < ApplicationController
  def new
    @booking = Rental.new
  end

  def edit
  end

  def create
    @booking = Booking.new(rental_params)
    @booking.item = Listing.find(params[:item_id])
    @booking.user = current_user
    @booking.status = true
    @booking.save
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    @booking.save!
  end

  def destroy
    @rental = Booking.find(params[:id])
    @rental.destroy
  end

  private

  def rental_params
    params.require(:rental).permit(:status)
  end
end
