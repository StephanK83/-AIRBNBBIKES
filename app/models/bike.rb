class Bike < ApplicationRecord
  validates :brand, :color, :price, presence: true
  belongs_to :user
  has_many :bookings
end
