class ListingsController < ApplicationController
  def index
  end

  def create
  end

  private
  def post_params
    params.require(:listing).permit(:name, :desctiption, :location, :policy, :num_bedroom, :num_bed, :num_bathroom, :max_guests, :all_tags)
  end

end