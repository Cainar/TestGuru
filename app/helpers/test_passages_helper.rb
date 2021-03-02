module TestPassagesHelper
  def success_message (test_passage)  
    test_passage.success? ? 'completed' : 'failed'
  end
end
