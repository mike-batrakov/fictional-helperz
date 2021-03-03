class ListingsController < ApplicationController
  def index
    @listing = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.create(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def update
    @listing = Listing.new(listing_params)
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
    params[:listings].permit(:name, :description, :status) #did not add :photo, :price: status. At least not yet.
  end

end
