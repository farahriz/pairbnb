class ReservationsController < ApplicationController

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = current_user.reservations.new(reservation_params)
		@reservation.listing = @listing

		if @reservation.save
			redirect_to reservation_path(@listing), notice: "Your reservation has been successfully created"

		else
			redirect_to '/'
		end

	end	

	private
		def reservation_params
    		params.require(:reservation).permit(:check_in, :check_out)
		end

end
