json.array! @reservations do |reservation|
  json.resourceId "#{reservation.listing_id}"
  json.title "#{reservation.number_of_guests}名 #{reservation.guest_name}"
  json.start "#{reservation.start_date}T15:00:00Z"
  json.end "#{reservation.end_date}T10:00:00Z"
end
