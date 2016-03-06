module Airbnb
  class Client
    def self.get_access_token(email, pass)
      require 'net/http'
      header = Constants::AIRBNB_CONFIG
      url = URI.parse("https://api.airbnb.com/v1/authorize")
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      https.verify_mode = OpenSSL::SSL::VERIFY_NONE

      req = Net::HTTP::Post.new(url.path, header)

      req.set_form_data({'username' => host_params["email"], 'password' => host_params["password"], 'prevent_account_creation' => 'true'})
      res = https.start do |http|
        http.request(req)
      end
      JSON.parse(res.body)["access_token"]
    end
  end
end
