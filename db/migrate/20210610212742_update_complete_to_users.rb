class UpdateCompleteToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :test_passages, :complete, :boolean, using: 'complete::boolean', :limit => nil, default: false
    add_column :test_passages, :rate, :float, :limit => nil, default: nil
  end
end
