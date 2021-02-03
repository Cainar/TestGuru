class Test < ApplicationRecord
  belongs_to :category
  has_many :user_histories
  has_many :users, through: :user_histories
  has_many :questions
  belongs_to :author, class_name: 'User'

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates_numericality_of :level, only_integer: true,
                                    greater_than: 0 



  scope :list_tests_by_category, ->(category) { 
      left_joins(:category)
      .where('categories.title = ?', category)
      .order(title: :desc)
      .pluck(:title) 
  } 
  scope :by_level, ->(level) { where('level = ?', level) }
  # скоупы по уровням сложности
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
end
