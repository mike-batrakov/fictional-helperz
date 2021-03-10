class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]

  def index
    # @listings = Listing.all
    @listings = policy_scope(Listing)
  end

  def show
  end

  def new
    @listing = Listing.new
    # @listing.user = current_user
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize @listing
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

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def listing_params
    params.require(:listing).permit(:name, :description) # did not add :photo, :price: status. At least not yet.
  end
end
