class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, :first_name, :last_name, :password, presence: true
  validates :email, uniqueness: true
  has_many :bikes
  has_many :bookings
end
