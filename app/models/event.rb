class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :attendee, through: :attendances, source: :user
  has_many :creator, through: :attendances, class_name: 'User'

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
