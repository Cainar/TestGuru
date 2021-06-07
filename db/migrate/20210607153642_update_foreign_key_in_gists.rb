class UpdateForeignKeyInGists < ActiveRecord::Migration[6.1]
  def change
    # обходим ограничение внешнего ключа, при создании gist
    # если был создан gist, то при удалении теста возникает ошибка
    # remove old foreign_key
    remove_foreign_key :gists, :questions
    # # add the new foreign_key 
    add_foreign_key :gists, :questions, on_delete: :cascade
  end
end
