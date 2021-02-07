class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  #validates :question, presence: true, if: :answers_limit?
  validate :limit_association, on: :create
  # выводит все правильные ответы
  scope :correct_answers, -> { where(correct: true) }

  private

  def limit_association
  	if question.answers.size >= 4
  		errors.add(:base, 'Question has too many answers')
  	end
  end
end
