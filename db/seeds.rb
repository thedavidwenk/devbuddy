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


# Clear existing users and bookings
Booking.destroy_all
User.destroy_all
puts "Deleting existing entries"
puts "Creating new entries"

# Users creation
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
    about_me: "A passionate developer who loves coding.",
    programming_languages: "Ruby, JavaScript",
    location: "Dublin, Ireland",
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
    about_me: "Enjoys learning new technologies and working on projects.",
    programming_languages: "Python, HTML, CSS",
    location: "Marrakech, Morocco"
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
    about_me: "Experienced in backend development and database management.",
    programming_languages: "Java, SQL",
    location: "Beijing, China"
  }
])

puts "Creating Bookings..."

user1 = User.first
user2 = User.last

# Create past and future bookings
past_time1 = Time.current - 1.day
future_time1 = Time.current + 1.hour

time_slot_past = TimeSlot.create!(
  user_id: user1.id,
  day: past_time1.wday,
  start_time: past_time1,
  end_time: past_time1 + 1.hour,
  reserved: false
)

time_slot_future = TimeSlot.create!(
  user_id: user1.id,
  day: future_time1.wday,
  start_time: future_time1,
  end_time: future_time1 + 1.hour,
  reserved: false
)

booking_past = Booking.create!(
  note: "Meeting for Ruby Basics",
  user_id: user1.id,
  booker_id: user2.id,
  time_slot_id: time_slot_past.id
)

booking_future = Booking.create!(
  note: "Learn about AJAX Requests",
  user_id: user2.id,
  booker_id: user1.id,
  time_slot_id: time_slot_future.id
)

puts "All done!"
