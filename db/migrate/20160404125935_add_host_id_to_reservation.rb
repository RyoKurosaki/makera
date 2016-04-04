class AddHostIdToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :host_id, :string
  end
end
