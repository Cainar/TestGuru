class RemoveIsAdminFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :is_admin, :boolean, default: false
  end
end
