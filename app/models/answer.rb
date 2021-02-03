class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validates :question, presence: true, if: :answers_limit?
  # выводит все правильные ответы
  scope :correct_answers, -> { where(correct: true) }

  private

  def answers_limit?
  	unless question.answers.size < 4
  		errors.add(:base, 'Question has too many answers')
  	end
  end
end
