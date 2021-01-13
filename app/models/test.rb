class Test < ApplicationRecord
  belongs_to :category
  has_many :user_history

  def self.list_tests_by_category(category)
  	@list = []
  	self.left_joins(:category).where('categories.title = ?', category).each do |tuple|
  		@list << tuple.title
  	end
  	@list
  end
end
