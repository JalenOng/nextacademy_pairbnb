class ListingsController < ApplicationController
	before_action :signed_in?, only: [:create, :destroy]
	
	def index
		# @listings = Listing.all
		# @listings = Listing.joins(:reservations).group("reservation.listing_id").order("count(reservation.listing_id) desc")
		@listings = Listing.paginate(page: params[:page], :per_page => 5).order(created_at: :desc)

	end


	def show
		@listing = Listing.find(params[:id])

	end

	def search
		render json: Listing.search(params[:query], fields: [{location: :text_start}], limit: 10).map(&:location)
	end


	def new
		if current_user
			@listing = current_user.listings.new
			@tag = @listing.tags.build
		end
		redirect_to sign_in_path, notice: "Please sign in to continue."  and return
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
