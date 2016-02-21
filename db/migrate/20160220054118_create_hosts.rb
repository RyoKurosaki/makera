class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :host_id
      t.string :host_name
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
