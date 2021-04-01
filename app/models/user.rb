require 'digest/sha1'

class User < ApplicationRecord
  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

	has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, 
            format: { with: VALID_EMAIL_REGEX, message: "invalid email format" },
            uniqueness: true

  has_secure_password

	def list_tests_by_level(level)
		tests.by_level(level)
	end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
