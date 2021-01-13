class User < ApplicationRecord
	has_many :user_history
	def list_tests_by_level level 
		@list = []
		UserHistory.left_joins(:user, :test)
				   .where('user_id = ? AND tests.level = ?', self.id, level)
				   .each do |tuple|
			@list << tuple.test.title
		end
		@list
	end
end
