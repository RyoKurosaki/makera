json.array!(@hosts) do |host|
  json.extract! host, :id, :host_id, :host_name, :email, :password,
  json.url host_url(host, format: :json)
end
