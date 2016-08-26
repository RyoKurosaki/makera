json.array! @schedules do |schedule|
  json.title "#{schedule.staff_id} #{schedule.listing_id}"
  json.start "#{schedule.cleaning_date}T10:00:00Z"
  json.end "#{schedule.cleaning_date}T15:00:00Z"
  json.tooltip "<div id='tooltip'>ユーザー:#{schedule.user_email}<br>清掃スタッフ:#{schedule.staff_id}</div>"
end
