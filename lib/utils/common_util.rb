module Utils
  class CommonUtil
    require 'heroku-api'

    def self.restart_heroku
      if Rails.env.production?
        heroku = Heroku::API.new
        heroku.post_ps_restart('makera')
        Rails.logger.debug('heroku is restarting')
      else
        Rails.logger.debug('本番環境はherokuが再起動')
      end
    end

    def self.password_gen(length=8)
      numbers = [*0..9]
      alpha_bigs = [*'A'..'Z']
      alpha_smalls = [*'a'..'z']
      symbols = "! # $ % & @ + * ?".split(/\s+/)

      codes = [numbers, alpha_bigs, alpha_smalls, symbols].shuffle
      password = []

      length.times do |i|
        password << codes[i % codes.length].sample(1)
      end
      password.shuffle.join
    end

    def self.regist_host(host_params)
      require 'airbnb/client'
      begin
        host_params["access_token"] = Airbnb::Client.get_access_token(host_params["email"], host_params["password"])

        user = Airbnb::Client.get_host_info(host_params["access_token"])
        host_params["host_id"] = user['user']['id']
        host_params["host_name"] = user['user']['first_name']
        @host = Host.new(host_params)

        listings = Airbnb::Client.get_listing_info(host_params["host_id"])

        listings.each do |list|
          listing = Listing.new
          listing.listing_id = list['listing']['id']
          listing.listing_address = list['listing']['address']
          listing.name = list['listing']['name']
          listing.host_id = host_params["host_id"]
          listing.save
        end
        @host.save
      rescue ServerError => e
        Rails.logger.debug(e.message)
        HostRegisterJob.set(wait: 1.minute).perform_later(host_params)
        Rails.logger.debug('再度Job登録を実行しました。')
        false
      end
    end
  end
end
