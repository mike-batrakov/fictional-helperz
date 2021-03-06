class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
    # @listing.user = current_user
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    if @listing.save!
      redirect_to listing_path(@listing)
    else
      render :edit
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :description) # did not add :photo, :price: status. At least not yet.
  end
end
