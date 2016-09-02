class ChangeActiveStateJob < ActiveJob::Base
  queue_as :active

  def perform()
    require 'airbnb/client'

    now = Time.current
    fiveminsago = now.ago(300).strftime('%H:%M:00')
    fiveminssince = now.since(300).strftime('%H:%M:00')
    listing_starts = Listing.joins("INNER JOIN hosts ON hosts.host_id = listings.host_id").select("listings.*, hosts.access_token").where(active_time_start: (fiveminsago)..(fiveminssince), auto_active_deactive: true)
    listing_ends = Listing.joins("INNER JOIN hosts ON hosts.host_id = listings.host_id").select("listings.*, hosts.access_token").where(active_time_end: (fiveminsago)..(fiveminssince), auto_active_deactive: true)
    listing_starts.each do |listing_start|
      unless Airbnb::Client.change_listing_active_state(listing_start.listing_id, listing_start.access_token, true)
      end
    end
    listing_ends.each do |listing_end|
      unless Airbnb::Client.change_listing_active_state(listing_end.listing_id, listing_end.access_token, false)
      end
    end
  end
end
