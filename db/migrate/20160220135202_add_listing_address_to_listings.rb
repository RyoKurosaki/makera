class AddListingAddressToListings < ActiveRecord::Migration
  def change
    add_column :listings, :listing_address, :string
  end
end
