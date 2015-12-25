class Tag < ActiveRecord::Base
	has_many :listing_tags
	has_many :listings, through: :listing_tags
	accepts_nested_attributes_for :listings,  allow_destroy: true
end