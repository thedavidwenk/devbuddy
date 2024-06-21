# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb



# Clear existing users------------------------
Booking.destroy_all
User.destroy_all
puts "Deleting existing entries"
puts "Creating new entries"

# Users creation -----------------------------

users = User.create!([
  {
    email: "madonna@madonna.com",
    password: "password123",
    password_confirmation: "password123",
    first_name: "Madonna",
    last_name: "Ciccone",
    username: "madonna",
    avatar: "https://i.pinimg.com/736x/4c/5b/f8/4c5bf873f703368d83f841812be4e96c.jpg",
    experience_level: "Expert",
    days_availability: "Weekdays",
    time_availability: "Evenings",
    about_me: "A passionate developer who loves coding.",
    programming_languages: "Ruby, JavaScript"
  },
  {
    email: "ladygaga@ladygaga.com",
    password: "password123",
    password_confirmation: "password123",
    first_name: "Lady",
    last_name: "Gaga",
    username: "ladygaga",
    avatar: "https://64.media.tumblr.com/d9939d665b9f01048f4f6ecb23c9871f/tumblr_pkepjs3cS61xm3be3o1_1280.jpg",
    experience_level: "Beginner",
    days_availability: "Weekends",
    time_availability: "Mornings",
    about_me: "Enjoys learning new technologies and working on projects.",
    programming_languages: "Python, HTML, CSS"
  },
  {
    email: "beyonce@beyonce.com",
    password: "password123",
    password_confirmation: "password123",
    first_name: "Beyonce",
    last_name: "Knowles",
    username: "beyonce",
    avatar: "https://media1.popsugar-assets.com/files/thumbor/7pCjLbKRLixIA8rwFaOjmjw1KpE=/2220x3000/filters:format_auto():quality(85):extract_cover()/2014/11/03/095/n/1922398/7bee161c20c24c89_71431710_10.jpg",
    experience_level: "Advanced",
    days_availability: "Mondays, Wednesdays",
    time_availability: "Afternoons",
    about_me: "Experienced in backend development and database management.",
    programming_languages: "Java, SQL"
  }
])

puts "Creating Bookings..."

user1 = User.first
user2 = User.last

start_time1 = Time.current + 1.hour
end_time1 = start_time1 + 1.hour

time_slot1 = TimeSlot.create!(
  user_id: user1.id,
  day: 1,
  start_time: start_time1,
  end_time: end_time1,
  reserved: false
)

start_time2 = Time.current + 2.hours
end_time2 = start_time2 + 1.hour

time_slot2 = TimeSlot.create!(
  user_id: user2.id,
  day: 2,
  start_time: start_time2,
  end_time: end_time2,
  reserved: false
)


booking1 = Booking.create!(
  note: "Meeting for Ruby Basics",
  user_id: user1.id,
  booker_id: user2.id,
  time_slot_id: time_slot1.id
)

# Create Booking 2 (user2 as user, user1 as booker)
booking2 = Booking.create!(
  note: "Learn about AJAX Requests",
  user_id: user2.id,
  booker_id: user1.id,
  time_slot_id: time_slot2.id
)


puts "All done!"
