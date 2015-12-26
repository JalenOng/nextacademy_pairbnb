# require_relative './concerns/bookable'

class Reservation < ActiveRecord::Base
  include Bookable
	belongs_to :user
	belongs_to :listing

end