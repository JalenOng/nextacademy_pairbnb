class ReservationJob < ActiveJob::Base
	queue_as :default

	def perform(cust_email, host_email, listing_id, reservation_id)


		ReservationMailer.booking_email(cust_email, host_email, listing_id, reservation_id).deliver_now
		
	end
end