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
		@listings = Listing.search(params[:query])
		render :index
	end


	def new
		@listing = current_user.listings.new
		# @tag = @listing.tags.build
	end


	def create

		@listing = current_user.listings.build(listing_params)
		@tag = params[:listing][:tag][:name]
		@taglist = @tag.downcase.split(",")
		@taglist.each{|x| x.gsub!(" ","")}
		@taglist = @taglist.uniq

		if @listing.save
			unless @taglist.empty?
				@taglist.each do |tag|
					@listing.tags << Tag.find_or_create_by(name: "#{tag}")
				end
			end

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
		# params.require(:listing).permit(:name, :bedroom, :accomodates, :location, :price_per_night, {images: []}, tags_attributes: [:id, :name, :_destroy])

		params.require(:listing).permit(:name, :bedroom, :accomodates, :location, :price_per_night, {images: []}, :tags)

	end

end
