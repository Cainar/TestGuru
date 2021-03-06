class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  PASS_RATE = 0.85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    self.current_question = next_question
    save!
  end

  def question_number
    question_index + 1
  end

  def success?
    success_rate >= PASS_RATE
  end

  def success_rate
    correct_questions / test.questions.count.to_f
  end

  def count_questions
    test.questions.count
  end

  def progress_percentage
    "#{progress_percent_calculate}%"
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    unless answer_ids.nil?
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    else
      false
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def progress_percent_calculate
    percent = (question_index * 1.0 / count_questions) * 100
    percent.round
  end

  def question_index
    test.questions.order(:id).find_index(current_question)
  end
end
