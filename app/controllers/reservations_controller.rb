class ReservationsController < ApplicationController
  before_action :get_listing, only: [:new, :show, :edit, :destroy]

  def get_listing
    @listing = Listing.find(params[:listing_id])
  end

  def index
  end

  def show
  end

  def new
    @reservation = @listing.reservations.new
 
  end

  def create
    byebug
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
