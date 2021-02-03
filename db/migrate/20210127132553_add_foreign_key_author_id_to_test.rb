class AddForeignKeyAuthorIdToTest < ActiveRecord::Migration[6.1]
  def change
  	add_column :tests, :author_id, :integer, default: nil, null: false
  	add_index :tests, :author_id
    add_foreign_key :tests, :users, column: :author_id
  end
end
