class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  # acts_as_favoritor gem setup
  acts_as_favoritor
  acts_as_favoritable

  # Skill levels to select from for users and search
  SKILL_LEVELS = ["Beginner", "Intermediate", "Advanced", "Expert"].freeze

  # validation 
  validates :first_name, length: { minimum: 2, maximum: 15 }, format: { with: /\A[a-zA-Z\s']+\z/, message: "only allows letters, spaces, and common punctuation" }
  validates :last_name, length: { minimum: 2, maximum: 15 }, format: { with: /\A[a-zA-Z\s']+\z/, message: "only allows letters, spaces, and common punctuation" }

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # A user can be involved in a booking either as user or booker
  has_many :bookings_as_user, class_name: 'Booking', foreign_key: 'user_id', dependent: :destroy
  has_many :bookings_as_booker, class_name: 'Booking', foreign_key: 'booker_id', dependent: :destroy
  has_many :time_slots, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # Combine both associations into a single bookings association
  def bookings
    Booking.where('user_id = ? OR booker_id = ?', id, id)
  end

  # PG Search
  include PgSearch::Model
  pg_search_scope :search_by_programming_language, against: :programming_languages,
    using: {
      tsearch: { prefix: true }
    }

  # Scope to filter by experience level
  scope :filter_by_experience_level, ->(level) { where(experience_level: level) if level.present? }

  def self.search(query, experience_level)
    results = query.present? ? search_by_programming_language(query) : all
    results = results.filter_by_experience_level(experience_level)
    results
  end
end
