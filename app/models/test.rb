class Test < ApplicationRecord
  belongs_to :category
  has_many :user_histories
  has_many :users, through: :user_histories
  has_many :questions
  belongs_to :author, class_name: 'User'

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true,
                                    greater_than: 0 }

  def self.list_tests_by_category (category)
      by_category(category).order(title: :desc).pluck(:title) 
  end

  scope :by_category, ->(category) { 
    left_joins(:category).where('categories.title = ?', category) 
  } 
  scope :by_level, ->(level) { where(level: level) }
  # скоупы по уровням сложности
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
end
