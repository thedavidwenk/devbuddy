class Booking < ApplicationRecord
  belongs_to :buddy1, class_name: 'User'
  belongs_to :buddy2, class_name: 'User'

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :buddy1, presence: true
  validates :buddy2, presence: true

  # With this line it selects the bookings where the date is greater than or equal to today's date.
  # The Upcoming scope is used in the users controller.
  scope :upcoming, -> { where('start_date >= ?', Date.today).order(start_date: :asc) }
end
