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
TimeSlot.destroy_all
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
  },
  {
    email: "adele@adele.com",
    password: "password123",
    password_confirmation: "password123",
    first_name: "Adele",
    last_name: "Adkins",
    username: "adele",
    avatar: "https://api.time.com/wp-content/uploads/2015/12/adele-portrait-03.jpg",
    experience_level: "Intermediate",
    about_me: "A singer who loves coding in her free time.",
    programming_languages: "C++, Swift",
    location: "London, UK"
  },
  {
    email: "ed@ed.com",
    password: "password123",
    password_confirmation: "password123",
    first_name: "Ed",
    last_name: "Sheeran",
    username: "edsheeran",
    avatar: "https://media.gq.com.mx/photos/617c1b4dbaf6be34ac935a9a/16:9/w_2560%2Cc_limit/ed.jpg",
    experience_level: "Beginner",
    about_me: "Musician learning to code.",
    programming_languages: "HTML, CSS",
    location: "Los Angeles, USA"
  }
])

puts "Creating Bookings..."

# Create past bookings (Jan-Mar 2024)
past_dates = [
  DateTime.new(2024, 1, 10, 10, 0, 0),
  DateTime.new(2024, 2, 15, 14, 0, 0),
  DateTime.new(2024, 3, 20, 9, 0, 0),
  DateTime.new(2024, 3, 25, 11, 0, 0),
  DateTime.new(2024, 3, 30, 15, 0, 0)
]

# Create future bookings (Oct-Nov 2024)
future_dates = [
  DateTime.new(2024, 10, 5, 10, 0, 0),
  DateTime.new(2024, 10, 10, 14, 0, 0),
  DateTime.new(2024, 11, 15, 9, 0, 0),
  DateTime.new(2024, 11, 20, 11, 0, 0),
  DateTime.new(2024, 11, 25, 15, 0, 0)
]

users_pairs = users.combination(2).to_a

# Create past bookings
past_dates.each_with_index do |date, index|
  user_pair = users_pairs[index % users_pairs.size]
  time_slot = TimeSlot.create!(
    user_id: user_pair.first.id,
    day: date.wday,
    start_time: date,
    end_time: date + 1.hour,
    reserved: false
  )

  Booking.create!(
    note: "Past meeting #{index + 1}",
    user_id: user_pair.first.id,
    booker_id: user_pair.last.id,
    time_slot_id: time_slot.id
  )
end

# Create future bookings
future_dates.each_with_index do |date, index|
  user_pair = users_pairs[(index + 5) % users_pairs.size]
  time_slot = TimeSlot.create!(
    user_id: user_pair.first.id,
    day: date.wday,
    start_time: date,
    end_time: date + 1.hour,
    reserved: false
  )

  Booking.create!(
    note: "Future meeting #{index + 1}",
    user_id: user_pair.first.id,
    booker_id: user_pair.last.id,
    time_slot_id: time_slot.id
  )
end

puts "All done!"
