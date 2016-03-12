class CreateTempStaffs < ActiveRecord::Migration
  def change
    create_table :temp_staffs do |t|
      t.string :name
      t.string :email
      t.string :tel
      t.date :interview_request_date
      t.timestamp :interview_date
      t.string :line_id
      t.text :inquiry

      t.timestamps null: false
    end
  end
end
