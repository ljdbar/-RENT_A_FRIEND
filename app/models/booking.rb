class Booking < ApplicationRecord
  belongs_to :friend
  belongs_to :user
  validates :start_date, presence: true, uniqueness: true, comparison: { greater_than: :end_date }
  validates :end_date, presence: true, uniqueness: true
  validates :total_price, presence: true, numericality: { only_float: true }
  validate :start_date_cannot_be_in_the_past

  private

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if start_date.present? && start_date < Date.today
  end
end
