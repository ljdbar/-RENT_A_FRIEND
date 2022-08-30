class Booking < ApplicationRecord
  belongs_to :friend
  belongs_to :user
  validates :start_date, presence: true, uniqueness: true, comparison: { greater_than: :end_date }
  validates :end_date, presence: true, uniqueness: true
  validates :total_price, presence: true, numericality: { only_float: true }
end

#Add START and END dates cannot be in the past
