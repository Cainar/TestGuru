module QuestionsHelper
  QUESTION_HEADERS = { 'new' => 'Create new', 'edit' => 'Edit' }.freeze

  def question_header(test, action_name)
    "#{QUESTION_HEADERS[action_name] || 'Undefined action with'} \"#{test.title}\" question"
  end
end
