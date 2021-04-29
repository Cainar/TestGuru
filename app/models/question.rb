class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :test

  has_many :gists
  has_many :users, through: :gists

  validates :body, presence: true
end
