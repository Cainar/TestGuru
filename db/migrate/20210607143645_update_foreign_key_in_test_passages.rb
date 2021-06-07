class UpdateForeignKeyInTestPassages < ActiveRecord::Migration[6.1]
  def change
    # обходим ограничение внешнего ключа, при прохождении теста создается current_question
    # если тест проходили то при его удалении возникает ошибка 
    # remove old foreign_key
    remove_foreign_key :test_passages, :questions, column: :current_question_id
    # # add the new foreign_key 
    add_foreign_key :test_passages, :questions, column: :current_question_id, on_delete: :cascade
  end
end
