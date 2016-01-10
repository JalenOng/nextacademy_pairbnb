#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create admin
User.create(email: "tom@cruise.com", password: "123456")

# Creates dummy users
5.times do
	User.create(email: Faker::Internet.email, password: "123456")
end

# Creates random number of listings

User.all.each do |user|
	rand(1..3).times do
		listing = user.listings.create(name: Faker::Hipster.sentence(3),
												 bedroom: rand(1..5),
												 accomodates: rand(2..5),
												 location: Faker::Address.country,
												 price_per_night: rand(80..250))
		listing.images = [Pathname.new(Rails.root + 'app/assets/images/sample_listing_image.jpg').open]
		listing.save!
	end
end

puts "\n= == === ==== ===== (\"\\( ^ o ^ )/\") ===== ==== === == ="
puts "\n  Success! You can login using the credentials below:"
puts "\n     email: tom@cruise.com        password: 123456"
puts "\n= == === ==== ===== ====== * ====== ===== ==== === == ="