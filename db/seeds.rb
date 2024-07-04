# Clear existing users------------------------
puts "Deleting existing entries"
Booking.destroy_all
TimeSlot.destroy_all
User.destroy_all

# Users creation -----------------------------
puts "Creating new entries"

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
  }
])

puts "Creating Users, Timeslots and Bookings..."

user1 = User.first
user2 = User.last

timeslot1 = TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 21),
  start_time: Time.new(2024, 6, 21, 10, 0, 0),
  end_time: Time.new(2024, 6, 21, 12, 0, 0),
  reserved: false
)

timeslot2 = TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 28),
  start_time: Time.new(2024, 7, 28, 8, 0, 0),
  end_time: Time.new(2024, 7, 28, 9, 0, 0),
  reserved: false
)

timeslot3 = TimeSlot.create!(
  user_id: user2.id,
  date: Date.new(2024, 7, 23),
  start_time: Time.new(2024, 6, 23, 13, 0, 0),
  end_time: Time.new(2024, 6, 23, 14, 0, 0),
  reserved: false
)

timeslot4 = TimeSlot.create!(
  user_id: user2.id,
  date: Date.new(2024, 8, 11),
  start_time: Time.new(2024, 8, 24, 20, 0, 0),
  end_time: Time.new(2024, 8, 24, 21, 0, 0),
  reserved: false
)

timeslot5 = TimeSlot.create!(
  user_id: user2.id,
  date: Date.new(2024, 8, 12),
  start_time: Time.new(2024, 8, 24, 18, 0, 0),
  end_time: Time.new(2024, 8, 24, 19, 0, 0),
  reserved: false
)

Booking.create!(
  note: "Meeting for Ruby Basics",
  user_id: user1.id,
  booker_id: user2.id,
  time_slot_id: timeslot1.id,
  booking_date: Date.new(2024, 9, 24),
  status: "open"
)

Booking.create!(
  note: "Learn about AJAX Requests",
  user_id: user2.id,
  booker_id: user1.id,
  time_slot_id: timeslot3.id,
  booking_date: Date.new(2024, 9, 16),
  status: "open"
)

puts "All done!"
