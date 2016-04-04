class GetReservationsJob < ActiveJob::Base
  queue_as :default

  def perform()
    require 'net/http'
    header = Constants::AIRBNB_CONFIG
    hosts = Host.all
    hosts.each do |host|
      header["X-Airbnb-OAuth-Token"] = host.access_token
      url = URI.parse("https://api.airbnb.com/v2/reservations?_limit=50&_offset=0&_format=v1_legacy_long&host_id=#{host.host_id}")
      # HTTPSを使うための設定
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      https.verify_mode = OpenSSL::SSL::VERIFY_NONE

      req = Net::HTTP::Get.new(url, header)

      res = https.start do |http|
        http.request(req)
      end

      reservations = JSON.parse(res.body)['reservations']
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
        reservation.user_email = host.user_email
        reservation.save
      end
    end
  end
end
