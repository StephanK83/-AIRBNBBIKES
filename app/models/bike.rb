class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  
  validates :size, presence: true 
  validates :user, presence: true
  validates :brand, presence: true
  validates :color, presence: true
  validates :price, presence: true
end
