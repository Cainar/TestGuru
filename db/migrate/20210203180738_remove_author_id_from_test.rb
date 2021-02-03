class RemoveAuthorIdFromTest < ActiveRecord::Migration[6.1]
  def change
  	remove_foreign_key :tests, :users, column: :author_id
  	remove_index :tests, :author_id
  	remove_column :tests, :author_id, :integer
  end
end
