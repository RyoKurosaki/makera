class HostRegisterJob < ActiveJob::Base
  queue_as :host

  def perform(host_params)
    require 'airbnb/client'
    hash = host_params
    hash["access_token"] = Airbnb::Client.get_access_token(host_params["email"], host_params["password"])

    user = Airbnb::Client.get_host_info(hash["access_token"])
    hash["host_id"] = user['user']['id']
    hash["host_name"] = user['user']['first_name']
    hash["user_email"] = current_user.email
    @host = Host.new(hash)

    listings = Airbnb::Client.get_listing_info(hash["host_id"])

    listings.each do |list|
      listing = Listing.new
      listing.listing_id = list['listing']['id']
      listing.listing_address = list['listing']['address']
      listing.name = list['listing']['name']
      listing.host_id = hash["host_id"]
      listing.save
    end
    @host.save
  end
end
