class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :host_id
      t.string :listing_id

      t.timestamps null: false
    end
  end
end
