class User < ApplicationRecord
	has_many :user_histories
	has_many :tests, through: :user_histories
	has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

	validates :email, presence: true
	
	def list_tests_by_level(level)
		tests.by_level(level)
	end
end
