class Reservation < ActiveRecord::Base
  belongs_to :listing, foreign_key: :listing_id, primary_key: :listing_id
  has_one :schedule, foreign_key: :reservation_id, primary_key: :reservation_id
end
