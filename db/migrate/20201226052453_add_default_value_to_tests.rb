class AddDefaultValueToTests < ActiveRecord::Migration[6.1]
  def change
  	change_column_default :tests, :level, from: nil, to: 1
  end
end
