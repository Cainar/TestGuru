class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
        :registerable, 
        :recoverable, 
        :rememberable,
        :trackable, 
        :validatable,
        :confirmable

	has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :gists
  has_many :questions, through: :gists

	def list_tests_by_level(level)
		tests.by_level(level)
	end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end
end
