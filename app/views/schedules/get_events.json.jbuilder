json.array! @schedules do |schedule|
  json.title "#{schedule.listing.name}"
  json.start "#{schedule.cleaning_date}"
  json.end "#{schedule.cleaning_date}"
  json.tooltip "【物件名】#{schedule.listing.name}<br>\
                【住所】#{schedule.listing.listing_address}<br>\
                【ホスト名】#{schedule.owner_name}<br>\
                【ホスト連絡先】#{schedule.owner_email}<br>\
                【次回ゲスト名】#{schedule.reservation.guest_name}<br>\
                【次回人数】#{schedule.reservation.number_of_guests}人<br>\
                【次回チェックイン】#{schedule.reservation.start_date}<br>\
                【清掃スタッフ】#{schedule.staff_name}<br>\
                【清掃予定時間】10:00:00~15:00:00<br>\
                【待機時間】#{schedule.wait_time}分"
end
