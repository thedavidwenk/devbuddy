class User < ApplicationRecord
  # Include default devise modules. Others available are:
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
end
