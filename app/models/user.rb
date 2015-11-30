class User < ActiveRecord::Base
  include Clearance::User
  has_many :listings, dependent: :destroy
  
end
