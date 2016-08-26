class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :host_id
      t.string :listing_id
      t.string :user_email
      t.date :cleaning_date
      t.string :staff_id
      t.string :wait_time
      t.date :next_checkin

      t.timestamps null: false
    end
  end
end
