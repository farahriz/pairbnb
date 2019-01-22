class BraintreeController < ApplicationController
  # before_action :require_login
  before_action :set_reservation, only: [:new,:create]

  def new
  	@client_token = Braintree::ClientToken.generate
  end

  def create
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    result = Braintree::Transaction.sale(
     :amount => "10.00", #this is currently hardcoded
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )

    if result.success?
      @reservation.update(status: true)
      redirect_to reservation_path(@reservation), :flash => { :success => "Transaction successful!" }
    else
      redirect_to reservation_path(@reservation), :flash => { :danger => "Transaction failed. Please try again." }
    end
  end


  private 

  def set_reservation 
    @reservation = Reservation.find(params[:reservation_id])
  end
  
end
