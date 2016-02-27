json.array! @reservations do |reservation|
  json.resourceId "#{reservation.listing_id}"
  json.title "#{reservation.guest_name} #{reservation.number_of_guests} guests"
  json.start "#{reservation.start_date}T15:00:00Z"
  json.end "#{reservation.end_date}T10:00:00Z"
end
