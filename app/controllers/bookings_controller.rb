class BookingsController < ApplicationController
  before_action :find_booking, only: %i[show edit update destroy]

  def show
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    @booking.user = current_user
    @booking.save
    authorize @booking
    redirect_to dashboard_path
  end

  def update
    @booking.status = params[:status]
    @booking.save!
    redirect_to dashboard_path
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Bookings.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date)
  end
end
