class ReservationMailer < ApplicationMailer
	def booking_email(customer, host, listing_id, reservation_id)
		# @url = listing_reservation_url(listing_id, reservation_id)
		@url = "/listings/#{listing_id}/reservations/#{reservation_id}"

		@host = host
		@customer = customer
		mail(to: @host, subject: "You have received a booking from #{@customer}")

	end
end
