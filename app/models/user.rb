class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  validates :email, presence: true
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
end
