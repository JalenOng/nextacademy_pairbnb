#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create admin
User.create(email: "tom@cruise.com", 
						password: "123456",
						avatar: File.open(Rails.root + 'app/assets/images/mabul.jpg'))
puts "==============================================================================="
puts "Admin user created!"
puts "==============================================================================="

# Creates dummy users

puts "\n==============================================================================="
5.times do
	User.create(email: Faker::Internet.email, 
							password: "123456",
							avatar: Faker::Avatar.image)
end
puts "==============================================================================="
puts "Total number of users created: #{User.all.count}\n\n"

# Creates random number of listings

puts "\n==============================================================================="
User.all.each do |user|
	rand(1..3).times do
		listing = user.listings.create(name: Faker::Hipster.sentence(3)[0..30],
																	 bedroom: rand(1..5),
																	 accomodates: rand(1..5),
																	 location: Faker::Address.country,
																	 price_per_night: rand(40..500))
		listing.images = [Pathname.new(Rails.root + "app/assets/images/listings/#{rand(1..12)}.jpg").open]
		listing.save!
	end
	puts "==============================================================================="
	puts "#{user.listings.all.count} listing(s) created for #{user.email}!"
	puts "==============================================================================="
end
puts "Total number of listings created: #{Listing.all.count}"
puts "===============================================================================\n\n"

puts "\n=============================== (\"\\( ^ o ^ )/\") ==============================="
puts "              Success! You can login using the credentials below:"
puts "                 email: tom@cruise.com        password: 123456"
puts "==============================================================================="