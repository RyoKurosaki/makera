class RenameUserEmailColumnToHosts < ActiveRecord::Migration
  def change
    rename_column :hosts, :user_email, :user_id
  end
end
