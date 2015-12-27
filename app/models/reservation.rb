# require_relative './concerns/bookable'

class Reservation < ActiveRecord::Base
  include Bookable
	belongs_to :user
	belongs_to :listing

	def get_reservation_amt(listing)


		self.length = (self.end_time - self.start_time).to_i

    self.amount = self.length * listing.price_per_night 

	end

end