class TimeSlot < ApplicationRecord
  belongs_to :user

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :day, presence: true
  validates :user, presence: true
end
