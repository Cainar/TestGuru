module TestPassagesHelper
  def result_message(test_passage)
    if success_rate(test_passage) < 85
      'was failed'
    else
      'was completed'
    end
  end

  def success_rate(test_passage)
    (test_passage.correct_questions * 100 / test_passage.test.questions.count).round(1)
  end
end
