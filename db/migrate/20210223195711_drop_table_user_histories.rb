class DropTableUserHistories < ActiveRecord::Migration[6.1]
  def up
    drop_table :user_histories, if_exists: true
  end
end
