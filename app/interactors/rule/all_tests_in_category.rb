class Rule::AllTestsInCategory < BadgeRule
  NAME = 'AllTestsInCategory'

  def call
    test_passage = context.test_passage
    category = test_passage.test.category
    user = test_passage.user
    # проверяем что пользователь успешно завершил все тесты в категории
    result = (category_completed_tests(user, category) & category.tests) == category.tests
    self.class.set_result(result)
  end

  private

  def category_completed_tests(user, category)
    tests = []
    user_test_passages = user.test_passages.where(test: category.tests).where("rate >= ?", TestPassage::PASS_RATE)
    user_test_passages.each do |test_passage|
      tests << test_passage.test
    end
    tests
  end
end

