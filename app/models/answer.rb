class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  # выводит все правильные ответы
  scope :correct_answers, -> { where(correct: true) }
end
