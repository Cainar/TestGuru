class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :body, limit: 1000
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
