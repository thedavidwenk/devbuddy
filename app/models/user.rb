class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # A user can be involved in a booking either as user or booker
  has_many :bookings_as_user, class_name: 'Booking', foreign_key: 'user_id'
  has_many :bookings_as_booker, class_name: 'Booking', foreign_key: 'booker_id'
  has_many :time_slots

  # Combine both associations into a single bookings association
  def bookings
    Booking.where('user_id = ? OR booker_id = ?', id, id)
  end

  # PG Search
  include PgSearch::Model
  pg_search_scope :search_by_programming_language_and_experience_level,
  against: [ :programming_languages, :experience_level ],
  using: {
    tsearch: { prefix: true }
  }

end
