class ChangeRoleToUsers < ActiveRecord::Migration[6.1]
  def up
  	change_column :users, :role, :boolean, :limit => nil
  	change_column_default :users, :role, false
  	rename_column :users, :role, :is_admin
  end

  def down
  	change_column :users, :is_admin, :string, :limit => 4
  	change_column_default :users, :is_admin, nil
  	rename_column :users, :is_admin, :role
  end
end
