module Airbnb
  class Client
    require 'net/http'
    # this method requires 2 argument(email, password)
    # return value is access token for Airbnb login
    def self.get_access_token(email, pass)
      header = Constants::AIRBNB_CONFIG
      url = URI.parse("https://api.airbnb.com/v1/authorize")
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      https.verify_mode = OpenSSL::SSL::VERIFY_NONE
      req = Net::HTTP::Post.new(url.path, header)

      req.set_form_data({'username' => email, 'password' => pass, 'prevent_account_creation' => 'true'})
      res = https.start do |http|
        http.request(req)
      end
      JSON.parse(res.body)["access_token"]
    end
    # this method requires access token
    # return value is infomation of host
    def self.get_host_info(access_token)
      header = Constants::AIRBNB_CONFIG
      header["X-Airbnb-OAuth-Token"] = access_token
      url = URI.parse("https://api.airbnb.com/v1/account/active")
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      https.verify_mode = OpenSSL::SSL::VERIFY_NONE
      req = Net::HTTP::Get.new(url.path, header)
      res = https.start do |http|
        http.request(req)
      end
      JSON.parse(res.body)['user']
    end

    def self.get_listing_info(host_id)
      header = Constants::AIRBNB_CONFIG
      url = URI.parse("https://api.airbnb.com/v1/users/#{host_id}/listings")
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      https.verify_mode = OpenSSL::SSL::VERIFY_NONE
      req = Net::HTTP::Get.new(url.path, header)
      res = https.start do |http|
        http.request(req)
      end
      JSON.parse(res.body)['listings']
    end
  end
end
