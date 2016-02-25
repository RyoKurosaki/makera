class Listing < ActiveRecord::Base
  has_one :reservation, foreign_key: :listing_id
end
