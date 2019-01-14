class ListingsController < ApplicationController
  before_action :set_listing, only:[:edit, :update, :delete, :destroy, :show]

  def index
    if params[:tag]
      @listings = Listing.tagged_with(params[:tag].titleize).paginate(:page => params[:page])
    else
      @listings = Listing.page(params[:page]).order('created_at DESC')
    end

  end

  def edit
    if not_allowed?
        flash[:notice] = "Sorry. You are not allowed to perform this action."
        return redirect_to listing_path(@listing), notice: "Sorry. You do not have the permission to edit a listing that you didn't post yourself."
    end
  end

  def new
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
  end


  def update 
    if @listing.update(listing_params)
      redirect_to listing_path(@listing), notice: "Listing updated." # or redirect_to @listing
    else
      render :edit, error: "Listing couldn't update, please try again."
    end
  end

  def destroy
    if not_allowed?
        flash[:notice] = "Sorry. You are not allowed to perform this action."
        return redirect_to listing_path(@listing), notice: "Sorry. You do not have the permission to edit a listing that you didn't post yourself."
    else 
      @listing.taggings.each do |tagging|
        tagging.destroy
      end
      @listing.destroy
      redirect_to listings_path, notice: "Your listing was successfully deleted"
    end
  end

  private
  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :description, :price, :location, :policy, :num_bedroom, :num_bed, :num_bathroom, :max_guests, :all_tags)
  end


  def not_allowed?
    current_user == nil or !(current_user.superadmin? or @listing.user == current_user)
  end

  # def authorise_user
  #   redirect_to listing_path(@listing) if current_user == nil or !(current_user.superadmin? or @listing.user == current_user)
  # end

end