class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 255
      t.string :login, limit: 50
      t.string :role, limit: 4

      t.timestamps
    end
  end
end
