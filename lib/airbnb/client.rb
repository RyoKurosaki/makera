module Airbnb
  class Client
    require 'net/http'
    require 'heroku-api'

    def self.restart_heroku
      heroku = Heroku::API.new
      heroku.post_ps_restart('makera')
    end

    def self.responce_get(url, req)
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      https.verify_mode = OpenSSL::SSL::VERIFY_NONE
      i = 0
      while i < 2
        res = https.start do |http|
          http.request(req)
        end

        if res.code == '200'
          Rails.logger.debug('Success airbnb access')
          break
        elsif res.code == '420' || res.code == '500'
          i += 1
          restart_heroku
          Rails.logger.debug('Heroku was restarted')
          sleep 15
        else
          Rails.logger.debug('Not able to access to Airbnb Error')
          break
        end
      end
      res
    end

    def self.get_reservations(access_token, host_id)
      header = Constants::AIRBNB_CONFIG
      header["X-Airbnb-OAuth-Token"] = access_token
      url = URI.parse("https://api.airbnb.com/v2/reservations?_limit=50&_offset=0&_format=v1_legacy_long&host_id=#{host_id}")
      res = responce_get(url, Net::HTTP::Get.new(url, header))
      JSON.parse(res.body)['reservations']
    end
    # this method requires 2 argument(email, password)
    # return value is access token for Airbnb login
    def self.get_access_token(email, pass)
      header = Constants::AIRBNB_CONFIG
      url = URI.parse("https://api.airbnb.com/v1/authorize")
      req = Net::HTTP::Post.new(url.path, header)
      req.set_form_data({'username' => email, 'password' => pass, 'prevent_account_creation' => 'true'})
      res = responce_get(url, req)
      JSON.parse(res.body)["access_token"]
    end
    # this method requires access token
    # return value is infomation of host
    def self.get_host_info(access_token)
      header = Constants::AIRBNB_CONFIG
      header["X-Airbnb-OAuth-Token"] = access_token
      url = URI.parse("https://api.airbnb.com/v1/account/active")
      res = responce_get(url, Net::HTTP::Get.new(url.path, header))
      JSON.parse(res.body)['user']
    end

    def self.get_listing_info(host_id)
      header = Constants::AIRBNB_CONFIG
      url = URI.parse("https://api.airbnb.com/v1/users/#{host_id}/listings")
      res = responce_get(url, Net::HTTP::Get.new(url.path, header))
      JSON.parse(res.body)['listings']
    end
  end
end
