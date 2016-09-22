class AddAreaKeyCleaningGoodsGarbageToListings < ActiveRecord::Migration
  def change
    add_column :listings, :area, :integer
    add_column :listings, :key, :text
    add_column :listings, :cleaning_goods, :text
    add_column :listings, :garbage, :text
  end
end
