class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy accept decline]

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    @booking.status = nil
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
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

  def accept
    @booking.status = true
    if @booking.save!
      redirect_to dashboard_path
    else
      redirect_to :home
    end
  end

  def decline
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
