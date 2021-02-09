class Event < ApplicationRecord
    belongs_to :user 
    has_many :attendances
    has_many :attendee , through: :attendances, class_name: "User"
end
