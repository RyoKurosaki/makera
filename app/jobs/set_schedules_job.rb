class SetSchedulesJob < ActiveJob::Base
  queue_as :schedule

  def perform()
    listing_ids = Reservation.group(:listing_id).select("reservations.listing_id")
    listing_ids.each do |listingid|
      cnt = 0
      reservations = Reservation.where(listing_id: listingid.listing_id)
      reservations.each do |reservation|
        schedule = Schedule.where(reservation_id: reservation.reservation_id).first_or_initialize
        schedule.host_id = reservation.host_id
        schedule.listing_id = reservation.listing_id
        schedule.user_id = reservation.user_id
        schedule.reservation_id = reservation.reservation_id
        unless cnt == 0
          schedule.cleaning_date = reservations[cnt-1].end_date
        end
        schedule.save
        cnt += 1
      end
    end
  end
end
