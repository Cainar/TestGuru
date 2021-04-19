module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "#{t('common.edit')} \"#{question.test.title}\" #{Question.model_name.human}"
    else
      "#{t('common.create')} #{t('common.new')} \"#{question.test.title}\" #{controller_name.singularize}"
    end
  end
end
