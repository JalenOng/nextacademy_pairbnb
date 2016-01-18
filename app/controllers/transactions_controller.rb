class TransactionsController < ApplicationController

  before_action :get_reservation

  def get_reservation
    @reservation = Reservation.find(params[:reservation_id])

  end

  def new
 	
  	gon.client_token = generate_client_token
  end

  def create

    @listing = @reservation.listing
  	nonce = params[:payment_method_nonce]

  # Use payment method nonce here...
  

  	sale_result = Braintree::Transaction.sale(
  	:amount => "RM2500",
  	:payment_method_nonce => nonce
		)
  	
    result = Braintree::TestTransaction.settle(sale_result.transaction.id)

    byebug
    result = Braintree::TestTransaction.settlement_confirm(sale_result.transaction.id)
    byebug

    if result
  	 redirect_to [@listing, @reservation]
    else
      render 'new'
    end
  end
  private

  def generate_client_token
  	Braintree::ClientToken.generate

  end


end



