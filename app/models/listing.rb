class Listing < ActiveRecord::Base
  has_many :reservations, foreign_key: :listing_id, primary_key: :listing_id
  has_many :schedules, foreign_key: :listing_id, primary_key: :listing_id
  belongs_to :host, foreign_key: :host_id, primary_key: :host_id
end
