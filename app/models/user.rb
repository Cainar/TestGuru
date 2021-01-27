class User < ApplicationRecord
	has_many :user_histories
	has_many :tests, through: :user_histories
	
	def list_tests_by_level level 
		UserHistory.left_joins(:user, :test)
				   .where('user_id = ? AND tests.level = ?', self.id, level)
				   .map(&:test)
	end
end
