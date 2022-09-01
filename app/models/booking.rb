class Booking < ApplicationRecord
  belongs_to :friend
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
  # validates :total_price, presence: true, numericality: { only_float: true }
  validate :start_date_cannot_be_in_the_past

  private

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if start_date.present? && start_date < Date.today
  end
end
