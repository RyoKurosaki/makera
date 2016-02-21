class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :guest_name
      t.string :host_name
      t.date :start_date
      t.date :end_date
      t.integer :number_of_guests
      t.string :listing_address

      t.timestamps null: false
    end
  end
end
