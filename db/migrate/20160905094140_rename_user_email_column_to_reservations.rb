class RenameUserEmailColumnToReservations < ActiveRecord::Migration
  def change
    rename_column :reservations, :user_email, :user_id
  end
end
