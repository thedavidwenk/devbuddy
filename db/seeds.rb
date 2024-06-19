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
# db/seeds.rb

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

# Bookings creation
Booking.create!([
  # Past bookings
  {
    start_date: Date.today - 10,
    end_date: Date.today - 10,
    note: "Completed project discussion",
    buddy1: users[0], # Madonna
    buddy2: users[1]  # Lady Gaga
  },
  {
    start_date: Date.today - 7,
    end_date: Date.today - 7,
    note: "Past code review session",
    buddy1: users[1], # Lady Gaga
    buddy2: users[2]  # Beyonce
  },
  {
    start_date: Date.today - 5,
    end_date: Date.today - 5,
    note: "Old debugging session",
    buddy1: users[0], # Madonna
    buddy2: users[2]  # Beyonce
  },
  # Upcoming bookings
  {
    start_date: Date.today + 1,
    end_date: Date.today + 1,
    note: "Pair programming session",
    buddy1: users[0], # Madonna
    buddy2: users[1]  # Lady Gaga
  },
  {
    start_date: Date.today + 3,
    end_date: Date.today + 3,
    note: "Backend development",
    buddy1: users[0], # Madonna
    buddy2: users[2]  # Beyonce
  },
  {
    start_date: Date.today + 5,
    end_date: Date.today + 5,
    note: "Frontend design review",
    buddy1: users[1], # Lady Gaga
    buddy2: users[2]  # Beyonce
  }
])
