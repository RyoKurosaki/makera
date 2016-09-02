class Listing < ActiveRecord::Base
  has_one :reservation, foreign_key: :listing_id
  belongs_to :host, foreign_key: :host_id, primary_key: :host_id
end
