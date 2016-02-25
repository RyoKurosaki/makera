class Reservation < ActiveRecord::Base
  belongs_to :listing, primary_key: :listing_id
end
