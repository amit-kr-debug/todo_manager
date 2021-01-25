class RenameColumnUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :name, :first_name
    rename_column :users, :password, :password_digest
    add_timestamps(:users)
  end
end
