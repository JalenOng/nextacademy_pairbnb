class Listing < ActiveRecord::Base
	has_many :listing_tags
	has_many :tags, through: :listing_tags
	has_many :reservations

	belongs_to :user
	mount_uploaders :images, ImageUploader
	# searchkick
end
