class Listing < ActiveRecord::Base
  has_one :reservation
end
