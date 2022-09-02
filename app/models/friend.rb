class Friend < ApplicationRecord
  belongs_to :user
  has_one_attached :photo # to attach images linked in Cloudinary
  has_many :bookings, dependent: :destroy # Destroy bookings when friend is deleted
  geocoded_by :location # Mapping the location attribute of friend
  after_validation :geocode, if: :will_save_change_to_location?

  validates :first_name, :last_name, :bio, :categories, :pronouns, :location, :age, :daily_rate, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :bio, length: { minimum: 50 }
  validates :categories, inclusion: { in: %w[sports music funeral family date travel] }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :daily_rate, numericality: { greater_than: 0 }

  include PgSearch::Model
  pg_search_scope :search_by_categories_and_location_and_age,
  against: [ :categories, :location, :age ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
