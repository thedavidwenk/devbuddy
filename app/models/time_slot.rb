class TimeSlot < ApplicationRecord
  belongs_to :user

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :day, presence: true, inclusion: { in: (0..6), message: "Pick a number between 0 and 6" }
  validates :user, presence: true
  validate :end_time_after_start_time


  private

  def end_time_after_start_time
    if end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
end
