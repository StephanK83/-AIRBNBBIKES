class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  SIZE = %w[51 53 55 57 60]
  validates :size, inclusion: { within: SIZE,  message: "%{value} is not in the list. It must be #{SIZE}"}, presence: true
  validates :user, presence: true
  validates :brand, presence: true
  validates :color, presence: true
  validates :price, presence: true
  validates :address, presence: true #added address field for geocoded 24.02.23

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :address, presence: true
  CATEGORY = %w[City Race MTB Gravel eBike]
  validates :category, inclusion: { within: CATEGORY, message: "%{value} is not in the list. It must be #{CATEGORY}" }, presence: true
  validates :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_brand_and_address,
  against: [ :brand, :address ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }


end
