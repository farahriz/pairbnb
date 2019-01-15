class ReservationsController < ApplicationController

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = current_user.reservations.new(reservation_params)

		if @reservation.save
			redirect_to reservation_path(@listing), notice: "Your reservation has been successfully created"

		else
			redirect_to '/'
		end

	end	

end
