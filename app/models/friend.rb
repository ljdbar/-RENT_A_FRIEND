class Friend < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :first_name, :last_name, :bio, :categories, :pronouns, :location, :age, :daily_rate, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :bio, length: { minimum: 50 }
  validates :categories, inclusion: { in: %w[sports music funeral family date travel] }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :daily_rate, numericality: { greater_than: 0 }
end
