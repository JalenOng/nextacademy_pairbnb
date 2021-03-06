class ListingsController < ApplicationController
	before_action :signed_in?, only: [:create, :destroy]

	def index
		# @listings = Listing.all
		# @listings = Listing.joins(:reservations).group("reservation.listing_id").order("count(reservation.listing_id) desc")
		# @listings = Listing.paginate(page: params[:page], :per_page => 5).order(created_at: :desc)

		if params[:search]
			@listings = Listing.where(location: params[:search].downcase).paginate(:page => params[:page], :per_page => 6).order('created_at DESC')
		else
			@listings = current_user.listings.paginate(:page => params[:page], :per_page => 6).order('created_at DESC')
		end
	end


	def show
		@listing = Listing.find(params[:id])
		@reservation = Reservation.new
	end

	def search
		@listings = Listing.search(params[:query])
		render :index
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

	def price_range
		@listings = Listing.where(location: params[:location])
		
		params[:from] = "0" if params[:from] == ""
		params[:to] = "10000" if params[:to] == ""
		
		@listings = @listings.where("price >= ? and price <= ?", params[:from], params[:to]).paginate(:page => params[:page], :per_page => 6).order('price ASC')

		respond_to do |format|
		  format.js
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
