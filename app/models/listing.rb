class Listing < ActiveRecord::Base
	has_many :listing_tags
	has_many :tags, through: :listing_tags, class_name: 'Tag'
	has_many :reservations
  belongs_to :user
	accepts_nested_attributes_for :reservations, allow_destroy: true
  accepts_nested_attributes_for :tags, allow_destroy: true
  accepts_nested_attributes_for :listing_tags

	# accepts_nested_attributes_for :reservations, reject_if: :all_blank, allow_destroy: true

	
	mount_uploaders :images, ImageUploader
	# searchkick
end
