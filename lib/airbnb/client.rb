module Airbnb
  class Client
    require 'net/http'
    require 'heroku-api'

    def restart_heroku
      heroku = Heroku::API.new
      heroku.post_ps_restart(APP)
    end

    def responce_get(header, url)
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      https.verify_mode = OpenSSL::SSL::VERIFY_NONE

      req = Net::HTTP::Get.new(url, header)

      i = 0
      while i < 2
        res = https.start do |http|
          http.request(req)
        end

        if res.code == '200'
          res
          break
        elseif res.code == '500'
          i += 1
          restart_heroku
        end
      end
    end

    def self.get_reservations(access_token, host_id)
      header = Constants::AIRBNB_CONFIG
      header["X-Airbnb-OAuth-Token"] = access_token
      url = URI.parse("https://api.airbnb.com/v2/reservations?_limit=50&_offset=0&_format=v1_legacy_long&host_id=#{host_id}")
      res = responce_get(header, url)
      JSON.parse(res.body)['reservations']
    end
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
      i = 0
      while i < 2
        res = https.start do |http|
          http.request(req)
        end
        if res.code == '200'
          JSON.parse(res.body)["access_token"]
          break
        elseif res.code == '500'
          i += 1
          restart_heroku
        end
      end
    end
    # this method requires access token
    # return value is infomation of host
    def self.get_host_info(access_token)
      header = Constants::AIRBNB_CONFIG
      header["X-Airbnb-OAuth-Token"] = access_token
      url = URI.parse("https://api.airbnb.com/v1/account/active")
      res = responce_get(header, url)
      JSON.parse(res.body)['user']
    end

    def self.get_listing_info(host_id)
      header = Constants::AIRBNB_CONFIG
      url = URI.parse("https://api.airbnb.com/v1/users/#{host_id}/listings")
      res = responce_get(header, url)
      JSON.parse(res.body)['listings']
    end
  end
end
