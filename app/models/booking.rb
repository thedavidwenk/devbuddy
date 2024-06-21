class Booking < ApplicationRecord
  belongs_to :buddy1, class_name: 'User'
  belongs_to :buddy2, class_name: 'User'

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :buddy1, presence: true
  validates :buddy2, presence: true

  # These SCOPES are used in the account_overview view file!! ------------------- >

  scope :upcoming, -> { where('start_date >= ?', Date.today).order(start_date: :asc) }
  scope :past, -> { where('start_date < ?', Date.today) }
end
