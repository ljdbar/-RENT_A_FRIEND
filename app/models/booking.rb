class Booking < ApplicationRecord
  belongs_to :friend
  belongs_to :user
  validates :start_date, presence: true, uniqueness: true, comparison: { greater_than: :end_date }
  validates :end_date, presence: true, uniqueness: true
  validates :total_price, presence: true, numericality: { only_float: true }
  validate :expiration_date_cannot_be_in_the_past

  private

  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end
end

#Add START and END dates cannot be in the past
