class ListingsController < ApplicationController
  def index
    if params[:tag]
      @listings = Listing.tagged_with(params[:tag].titleize)
    else
  	  @listings = Listing.all
    end

  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def new
  	# byebug
    @listing = Listing.new
  end

  def create
  	# byebug
    @listing = current_user.listings.new(listing_params)

    if @listing.save
      redirect_to listing_path(@listing), notice: "Your listing has successfully created"

    else
      redirect back
      # render :new, error: "Piglet wasn't created, please try again." # Investigate getting the error messages from your object errors and sending them as a flash message!
    end

  end

  def show
    @listing = Listing.find(params[:id])
  end


  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to listing_path(@listing), notice: "Listing updated." # or redirect_to @listing
    else
      render :edit, error: "Listing couldn't update, please try again."
    end
  end


  private
  def listing_params
    params.require(:listing).permit(:name, :desctiption, :location, :policy, :num_bedroom, :num_bed, :num_bathroom, :max_guests, :all_tags)
  end

end