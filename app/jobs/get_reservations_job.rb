class GetReservationsJob < ActiveJob::Base
  queue_as :default

  def perform()
    require 'airbnb/client'

    hosts = Host.all
    hosts.each do |host|

      reservations = Airbnb::Client.get_reservations(host.access_token, host.host_id)
      reservations.each do |reserve|
        host_id = reserve['host']['user']['id']
        host_name = reserve['host']['user']['first_name']
        guest_name = reserve['guest']['user']['first_name']
        start_date = Date.parse(reserve['start_date'])
        nights = reserve['nights']
        number_of_guests = reserve['number_of_guests']
        reservation_id = reserve['id']
        listing_id = reserve['listing']['listing']['id'].to_s
        reservation = Reservation.where(reservation_id: reservation_id).first_or_initialize
        reservation.host_id = host_id
        reservation.host_name = host_name
        reservation.guest_name = guest_name
        reservation.start_date = start_date
        reservation.end_date = start_date + nights
        reservation.number_of_guests = number_of_guests
        reservation.reservation_id = reservation_id
        reservation.listing_id = listing_id
        reservation.user_id = host.user_id
        reservation.save
      end
    end
  end
end
