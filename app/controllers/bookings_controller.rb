class BookingsController < ApplicationController
<<<<<<< HEAD
  before_action :set_booking, only: %i[edit update destroy]
=======
  before_action :find_booking, only: [:show, :update, :destroy]
>>>>>>> master

  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
<<<<<<< HEAD
    @booking.status = true
    @booking.listing = Listing.find(params[:listing_id])
    authorize @booking
=======
>>>>>>> master
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params) 
   
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    @booking.user = current_user
    @booking.save
<<<<<<< HEAD
    authorize @booking
    redirect_to dashboard_path
=======
    redirect_to booking_path(@booking)
  end

  def show 
>>>>>>> master
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

<<<<<<< HEAD
  def set_booking
    @booking = Bookings.find(params[:id])
    authorize @booking
  end

=======
  def find_booking
    @booking = Booking.find(params[:id])
  end
>>>>>>> master
  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
