json.array! @reservations do |reservation|
  json.id "#{reservation.listing_id}"
  json.host "#{reservation.host_name}"
  json.listing "#{reservation.listing_id}"
end
