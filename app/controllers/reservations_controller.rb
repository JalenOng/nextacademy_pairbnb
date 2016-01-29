class ReservationsController < ApplicationController
  respond_to :html, :json
  before_action :get_listing

  def get_listing
    @listing = Listing.find(params[:listing_id])
  end

  def index
    @reservations = Reservation.where("listing_id = ? AND end_time >= ?", @listing_id, Time.now).order(:start_time)
    respond_with @listings
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = @listing.reservations.new

  end

  def create

    @reservation = current_user.reservations.build(reservation_params)
    @reservation.listing = @listing

    @reservation.get_reservation_amt(@listing)

    @host = "bestofthesoul@gmail.com"

    if @reservation.save
      # ReservationMailer.booking_email(current_user.email, @host, @listing.id, @reservation.id).deliver_now
      ReservationJob.perform_later(current_user.email, @host, @listing.id, @reservation.id)
      redirect_to new_listing_reservation_transaction_path(@listing, @reservation)
      # redirect_to [@listing, @reservation]
    else
      render 'new'
    end


  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation = current_user.reservations.build(reservation_params)
      flash[:notice] = "Your booking is updated successfully"

      if request.xhr?
        render json: {status: :success}.to_json
      else
        redirect_to listing_reservation_path(@listing)
      end

    else
      render 'edit'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id]).destroy
    if @reservation.destroy

      flash[:notice] = "Booking deleted"
      redirect_to listings_path

    else
      render 'index'
    end
  end

  private


  def reservation_params
    params.require(:reservation).permit(:listing_id, :start_time, :end_time, :length)
  end

end
