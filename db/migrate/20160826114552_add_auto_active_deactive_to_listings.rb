class AddAutoActiveDeactiveToListings < ActiveRecord::Migration
  def change
    add_column :listings, :auto_active_deactive, :boolean, null: false, default: false
    add_column :listings, :active_time_start, :time, null: false, default: "20:00:00"
    add_column :listings, :active_time_end, :time, null: false, default: "8:00:00"
  end
end
