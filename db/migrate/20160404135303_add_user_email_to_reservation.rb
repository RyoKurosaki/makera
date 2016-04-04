class AddUserEmailToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :user_email, :string
  end
end
