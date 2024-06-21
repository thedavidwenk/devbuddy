class Booking < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :booker, class_name: 'User'
  belongs_to :time_slot

  validates :user, presence: true
  validates :booker, presence: true
  validates :time_slot, presence: true

  # These SCOPES are used in the account_overview view file!! ------------------- >

  scope :upcoming, -> { where('start_date >= ?', Date.today).order(start_date: :asc) }
  scope :past, -> { where('start_date < ?', Date.today) }
end
