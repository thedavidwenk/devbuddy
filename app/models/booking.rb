class Booking < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :booker, class_name: 'User'
  belongs_to :time_slot

  validates :user, presence: true
  validates :booker, presence: true
  validates :time_slot, presence: true

  # With this line it selects the bookings where the date is greater than or equal to today's date.
  # The Upcoming scope is used in the users controller.
  scope :upcoming, -> { where('start_date >= ?', Date.today).order(start_date: :asc) }
end
