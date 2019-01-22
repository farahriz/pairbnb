class ReservationsController < ApplicationController

	def show
		@reservation = Reservation.find(params[:id])
	end

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = current_user.reservations.new(check_in: params['check_in'], check_out: params['check_out'], listing_id: params['listing_id'])
		
		@reservation.listing = Listing.find(params[:listing_id])

		if @reservation.save
			UserMailer.booking_email(@reservation.user, @reservation.listing.user, @reservation.listing).deliver_now
			# BookingsJob.perform)later(@reservation.user, @booking.listing.user)

			redirect_to listing_path(@reservation.listing), notice: "Your reservation has been successfully created"

		else
			redirect_to '/'
		end

	end	

	def index
		if current_user.superadmin?
			@reservations = Reservation.all
		else
			@reservations = current_user.reservations
		end	
	end

	private
		def reservation_params
    		params.require(:reservation).permit(:check_in, :check_out)
		end

end
