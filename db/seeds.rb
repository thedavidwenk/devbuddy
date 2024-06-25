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
  }
])

puts "Creating Bookings..."

user1 = User.first
user2 = User.last

# Create past and future bookings
past_times = [
  Time.new(2024, 1, 15, 10, 0, 0),
  Time.new(2024, 2, 10, 14, 0, 0),
  Time.new(2024, 2, 20, 16, 0, 0),
  Time.new(2024, 3, 5, 9, 0, 0),
  Time.new(2024, 3, 25, 11, 0, 0)
]

future_times = [
  Time.new(2024, 10, 5, 10, 0, 0),
  Time.new(2024, 10, 20, 14, 0, 0),
  Time.new(2024, 11, 10, 16, 0, 0),
  Time.new(2024, 11, 15, 9, 0, 0),
  Time.new(2024, 11, 25, 11, 0, 0)
]

past_times.each_with_index do |time, index|
  time_slot = TimeSlot.create!(
    user_id: user1.id,
    day: time.wday,
    start_time: time,
    end_time: time + 1.hour,
    reserved: false
  )

  Booking.create!(
    note: "Past Meeting #{index + 1}",
    user_id: user1.id,
    booker_id: user2.id,
    time_slot_id: time_slot.id
  )
end

future_times.each_with_index do |time, index|
  time_slot = TimeSlot.create!(
    user_id: user1.id,
    day: time.wday,
    start_time: time,
    end_time: time + 1.hour,
    reserved: false
  )

  Booking.create!(
    note: "Future Meeting #{index + 1}",
    user_id: user2.id,
    booker_id: user1.id,
    time_slot_id: time_slot.id
  )
end

puts "All done!"
