class RemoveListingAddressFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :listing_address, :string
  end
end
