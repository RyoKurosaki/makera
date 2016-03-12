json.array!(@temp_staffs) do |temp_staff|
  json.extract! temp_staff, :id, :name, :email, :tel, :interview_request_date, :interview_date, :line_id, :inquiry
  json.url temp_staff_url(temp_staff, format: :json)
end
