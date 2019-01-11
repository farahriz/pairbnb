class ListingsController < ApplicationController
  def index
  	@listings = Listing.all
  end

  def edit
  end

  def new
  	# byebug
    @listing = Listing.new
  end

  def create
  	# byebug
    @listing = Listing.new(listing_params)

    if @listing.save


    else
      redirect back
    end
  end

  private
  def listing_params
    params.require(:listing).permit(:name, :desctiption, :location, :policy, :num_bedroom, :num_bed, :num_bathroom, :max_guests, :all_tags)
  end

end