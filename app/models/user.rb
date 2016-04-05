class User < ActiveRecord::Base
  include Clearance::User
  has_many :listings, dependent: :destroy
  has_many :reservations, dependent: :destroy
  
  mount_uploader :avatar, AvatarUploader
  
end
