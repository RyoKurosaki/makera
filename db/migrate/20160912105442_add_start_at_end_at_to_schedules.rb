class AddStartAtEndAtToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :start_time, :string, :default => "11:00"
    add_column :schedules, :end_time, :string, :default => "15:00"
  end
end
