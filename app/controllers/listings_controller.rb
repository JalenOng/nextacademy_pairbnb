class ListingsController < ApplicationController
	before_action :signed_in?, only: [:create, :destroy]
	
	def index
		@listings = Listing.all
	end


	def show
		@listing = Listing.find(params[:id])
	end

	def search
		render json: Listing.search(params[:query], fields: [{location: :text_start}], limit: 10).map(&:location)
	end


	def new
		@listing = current_user.listings.new
	end
	def create

		byebug
		@listing = current_user.listings.build(listing_params)
	
	
		if @listing.save
			flash[:success] = "Listing created"
			redirect_to @listing
		else

		
			render 'new'
		end
	end

	def edit

	end

	def update

	end
	
	def destroy
	end

	private

	def listing_params
		params.require(:listing).permit(:name, :bedroom, :accomodates, :location, :price_per_night, {images: []}, tags_attributes: [:id, :name, :_destroy])
	
	end

end
