class Rule::FirstAttempt < BadgeRule
  NAME = 'FirstAttempt'

  def call
    test_passage = context.test_passage
    user = test_passage.user
    test = test_passage.test
    # проверяем что пользователь успешно завершил все тесты в категории
    result = first_attempt(user, test) >= TestPassage::PASS_RATE
    self.class.set_result(result)
  end

  private

  def first_attempt(user, test)
    user.test_passages.where(test: test).first.rate
  end
end
