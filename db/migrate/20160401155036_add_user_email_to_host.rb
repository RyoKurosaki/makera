class AddUserEmailToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :user_email, :string
  end
end
