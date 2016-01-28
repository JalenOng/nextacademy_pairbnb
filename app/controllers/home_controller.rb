class HomeController < ApplicationController
  def index
  	@listings = Listing.all.paginate(:page => params[:page], :per_page => 12).order('created_at DESC')
  end
end