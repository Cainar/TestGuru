module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Edit \"#{question.test.title}\" #{controller_name.singularize}"
    else
      "Create new \"#{question.test.title}\" #{controller_name.singularize}"
    end
  end
end
