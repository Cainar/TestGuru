class Category < ApplicationRecord
  has_many :tests
  
  validates :title, presence: true

  #скоуп дефолnный, сортирует названия по возрастанию
  #после приходиться использовать reorder, чтобы поменять порядок
  default_scope { order(title: :asc) }
end
