class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :size, presence: true
  validates :user, presence: true
  validates :brand, presence: true
  validates :color, presence: true
  validates :price, presence: true
  validates :address, presence: true #added address field for geocoded 24.02.23

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
