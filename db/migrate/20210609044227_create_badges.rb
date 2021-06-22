class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, limit: 30
      t.string :file, limit: 512

      t.timestamps
    end
    add_index :badges, :name, unique: true
  end
end
