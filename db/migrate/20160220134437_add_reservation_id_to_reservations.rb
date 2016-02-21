class AddReservationIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :reservation_id, :string
  end
end
