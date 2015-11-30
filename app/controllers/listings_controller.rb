class ListingsController < ApplicationController
	before_action :signed_in?, only: [:create, :destroy]
	
	def show
		@listing = Listing.find(params[:id])
	end


	def new
		@listing = current_user.listings.new
	end
	def create

		@listing = current_user.listings.build(listing_params)
	
	
		if @listing.save
			flash[:success] = "Listing created"
			redirect_to @listing
		else

		
			render 'new'
		end
	end

	def destroy
	end

	private

	def listing_params
		params.require(:listing).permit(:name, :bedroom, :accomodates, :location, :price_per_night, {images: []})
	end

end
