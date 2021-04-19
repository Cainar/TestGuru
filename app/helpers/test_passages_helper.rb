module TestPassagesHelper
  def success_message (test_passage)  
    test_passage.success? ? t('common.complete') : t('common.fail') 
  end
end
