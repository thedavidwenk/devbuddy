class User < ApplicationRecord
  # skill levels to select from for users and search
  SKILL_LEVELS = ["Beginner", "Intermediate", "Advanced", "Expert"] 

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # A user can be involved in a booking either as buddy1 or buddy2
  has_many :bookings_as_buddy1, class_name: 'Booking', foreign_key: 'buddy1_id'
  has_many :bookings_as_buddy2, class_name: 'Booking', foreign_key: 'buddy2_id'

  # Combine both associations into a single bookings association
  def bookings
    Booking.where('buddy1_id = ? OR buddy2_id = ?', id, id)
  end

  # PG Search 
  include PgSearch::Model
  pg_search_scope :search_by_programming_language, against: :programming_languages,
    using: {
    tsearch: { prefix: true } 
  }

  # Scope to filter by experience level
  scope :filter_by_experience_level, -> (level) { where(experience_level: level) if level.present? }

  def self.search(query, experience_level)
    results = query.present? ? search_by_programming_language(query) : all
    results = results.filter_by_experience_level(experience_level)
    results
  end
end
