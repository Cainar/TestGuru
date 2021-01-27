class User < ApplicationRecord
	has_many :user_histories
	has_many :tests, through: :user_histories
	has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
	
	def list_tests_by_level level 
		Test.left_joins(:user_histories, :users)
			.where('user_id = ? AND tests.level = ?', self.id, level)
	end
end
