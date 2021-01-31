class Test < ApplicationRecord
  belongs_to :category
  has_many :user_histories
  has_many :users, through: :user_histories
  has_many :questions
  belongs_to :author, class_name: 'User'

  def self.list_tests_by_category(category)
    self.left_joins(:category)
      .where('categories.title = ?', category)
      .order(title: :desc)
      .pluck(:title)
  end
end
