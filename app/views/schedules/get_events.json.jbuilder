json.array! @schedules do |schedule|
  json.id "#{schedule.id}"
  json.title "#{schedule.listing.name}"
  json.start "#{schedule.cleaning_date} #{schedule.start_time}"
  json.end "#{schedule.cleaning_date} #{schedule.end_time}"
  json.tooltip "<p><h6>#{schedule.listing.name}</h6></p>\
                【住所】#{schedule.listing.listing_address}<br>\
                【ホスト名】#{schedule.owner_name}<br>\
                【ホスト連絡先】#{schedule.owner_email}<br>\
                【次回ゲスト名】#{schedule.reservation.guest_name}<br>\
                【次回人数】#{schedule.reservation.number_of_guests}人<br>\
                【次回チェックイン】#{schedule.reservation.start_date}<br>\
                【清掃スタッフ】#{schedule.staff_name}<br>\
                【清掃予定時間】#{schedule.start_time}~#{schedule.end_time}<br>\
                【待機時間】#{schedule.wait_time}分<br><br>\
                #{link_to '編集', edit_schedule_path(schedule), remote: true, class:'btn btn-default btn-xs btn-block'}"
end
