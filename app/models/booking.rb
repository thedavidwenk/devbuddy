class Booking < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :booker, class_name: 'User'
  belongs_to :time_slot

  validates :user, presence: true
  validates :booker, presence: true
  validates :booking_date, presence: true
  validates :time_slot, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: { in: ["open", "approved", "rejected"] }

  before_validation :set_default_status

  # These SCOPES are used in the account_overview view file!! ------------------- >

  scope :upcoming, -> { joins(:time_slot).where('time_slots.start_time >= ?', DateTime.now).order('time_slots.start_time ASC') }
  scope :past, -> { joins(:time_slot).where('time_slots.start_time < ?', DateTime.now).order('time_slots.start_time DESC') }

  private
  
  # Check if the status is nil (not set) or false
  def set_default_status
    if self.status.nil? || self.status == false
      self.status = 'open'
    end
  end
end
