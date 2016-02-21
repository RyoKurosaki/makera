class AddListingIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :listing_id, :string
  end
end
