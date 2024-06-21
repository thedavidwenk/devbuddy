class TimeSlot < ApplicationRecord
  belongs_to :user_id

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :day, presence: true
  validates :user, presence: true
end
