class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]

  def new
    @booking = Booking.new
    @booking.status = true
    @booking.listing = Listing.find(params[:listing_id])
    authorize @booking
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.listing = Listing.find(params[:listing_id])
    @booking.user = current_user
    @booking.status = true
    @booking.save
    authorize @booking
    redirect_to dashboard_path
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    @booking.save!
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Bookings.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
