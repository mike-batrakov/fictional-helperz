class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]

  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
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
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
