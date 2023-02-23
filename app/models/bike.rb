class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :size, presence: true 
  validates :user, presence: true
  validates :brand, presence: true
  validates :color, presence: true
  validates :price, presence: true
end
