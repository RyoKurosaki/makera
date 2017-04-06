class Schedule < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing, foreign_key: :listing_id, primary_key: :listing_id
  belongs_to :reservation, foreign_key: :reservation_id, primary_key: :reservation_id
  attr_accessor :color
end
