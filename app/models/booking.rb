class Booking < ApplicationRecord
  validates :start_date, :end_date, :total_price, presence: true
  belongs_to :user
  belongs_to :bike
end
