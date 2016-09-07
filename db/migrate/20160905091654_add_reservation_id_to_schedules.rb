class AddReservationIdToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :reservation_id, :string
    rename_column :schedules, :user_email, :user_id
  end
end
