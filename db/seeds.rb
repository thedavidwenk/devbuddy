# Clear existing users------------------------
puts "Deleting existing entries"
Booking.destroy_all
TimeSlot.destroy_all
User.destroy_all

# Users creation -----------------------------
puts "Creating new entries"

User.create!([
  {
    email: "rihanna@music.com",
    password: "securepassword3",
    password_confirmation: "securepassword3",
    first_name: "Rihanna",
    last_name: "Fenty",
    username: "rihanna",
    avatar: "https://i.pinimg.com/736x/c9/0e/fb/c90efb96e0eebbd93522a5a678551b4d.jpg",
    experience_level: "Beginner",
    about_me: "Beyond music and fashion, I'm fascinated by the potential of coding to shape the future of e-commerce. Learning HTML and Ruby allows me to explore integrating these skills with my businesses, creating innovative and interactive experiences for my fans.  It's a thrilling way to express creativity and connect with them on a whole new level.",
    programming_languages: "HTML, Ruby, CSS, Javascript, "
  },
  {
    email: "madonna@madonna.com",
    password: "password123",
    password_confirmation: "password123",
    first_name: "Madonna",
    last_name: "Ciccone",
    username: "madonna",
    avatar: "https://i.pinimg.com/736x/4c/5b/f8/4c5bf873f703368d83f841812be4e96c.jpg",
    experience_level: "Expert",
    about_me: "A passionate developer who loves coding. I have years of experience in the tech industry. My favorite projects involve creative problem-solving and innovative solutions.",
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
    about_me: "I enjoy learning new technologies and working on projects. My current focus is on web development. I find coding to be a great way to express creativity.",
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
    about_me: "I am experienced in backend development and database management. I enjoy tackling complex technical challenges. My goal is to optimize and enhance system performance.",
    programming_languages: "Java, SQL"
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
    about_me: "I am a singer who loves coding in my free time. I find programming to be a rewarding and creative outlet. My favorite languages to work with are C++ and Swift.",
    programming_languages: "C++, Swift"
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
    about_me: "I am a musician learning to code. The process of creating websites and applications is fascinating. I am excited to continue expanding my skills.",
    programming_languages: "HTML, CSS"
  },
  {
    email: "leo@dicaprio.com",
    password: "securepassword2",
    password_confirmation: "securepassword2",
    first_name: "Leonardo",
    last_name: "DiCaprio",
    username: "leodicaprio",
    avatar: "https://www.tvmovie.de/bilder/758/tvmm/leonardo-dicaprio-schaemt-sich-fuer-quottitanicquot-leonardo-dicaprio-titanic.jpg?itok=AxSpwgxW",
    experience_level: "Beginner",
    about_me: "As an actor and environmentalist, I am always looking for ways to make a difference. I recently started exploring coding and found it fascinating. I am excited to learn more and apply it to my projects.",
    programming_languages: "Python, Ruby"
  },
  {
    email: "dwayne@johnson.com",
    password: "securepassword4",
    password_confirmation: "securepassword4",
    first_name: "Dwayne",
    last_name: "Johnson",
    username: "therock",
    avatar: "https://papers.co/wallpaper/papers.co-hc37-the-rock-dwayne-johnson-action-actor-celebrity-29-wallpaper.jpg",
    experience_level: "Intermediate",
    about_me: "I am an actor and former wrestler, now venturing into the world of coding. It's a new challenge that I am thoroughly enjoying. I am eager to apply my skills to create impactful applications.",
    programming_languages: "Ruby, Java"
  },
  {
    email: "natalie@portman.com",
    password: "securepassword5",
    password_confirmation: "securepassword5",
    first_name: "Natalie",
    last_name: "Portman",
    username: "natalieportman",
    avatar: "https://cms.kartinimedia.id/assets/img/202306091122576169-EkHtE8DX0AA-s8l.jpg",
    experience_level: "Advanced",
    about_me: "As an actress with a degree in computer science, I have always had a passion for technology. Coding allows me to combine creativity with logical thinking. I am excited to work on projects that bridge my interests.",
    programming_languages: "C++, Ruby"
  },
  {
    email: "keanu@reeves.com",
    password: "securepassword6",
    password_confirmation: "securepassword6",
    first_name: "Keanu",
    last_name: "Reeves",
    username: "keanureeves",
    avatar: "https://cdn.mos.cms.futurecdn.net/AyZRXRAF37KwihUtAu4uJX.jpg",
    experience_level: "Beginner",
    about_me: "I am an actor who has recently developed a fascination for programming. The process of creating something from scratch is incredibly rewarding. I look forward to expanding my skills and working on exciting projects.",
    programming_languages: "Ruby, PHP, Go"
  },
  {
    email: "brad@pitt.com",
    password: "securepassword1",
    password_confirmation: "securepassword1",
    first_name: "Brad",
    last_name: "Pitt",
    username: "bradpitt",
    avatar: "https://www.yorkshirepost.co.uk/webimg/legacy_ash_77547539.jpg?width=1200&enable=upscale",
    experience_level: "Beginner",
    about_me: "I am an actor exploring the world of coding. JavaScript has quickly become one of my favorite languages. I'm excited to see where this new interest takes me.",
    programming_languages: "Ruby, JavaScript, HTML"
  },
  {
    email: "scarlett@johansson.com",
    password: "securepassword2",
    password_confirmation: "securepassword2",
    first_name: "Scarlett",
    last_name: "Johansson",
    username: "scarlettjohansson",
    avatar: "https://images.intouch.wunderweib.de/scarlett-johansson/1x1,id=7f2918c1,b=intouch,w=1600,h=,ca=21.89,0,78.14,100,rm=sk.jpeg",
    experience_level: "Intermediate",
    about_me: "As an actress, I enjoy diving into new challenges like coding. JavaScript has been a fantastic tool for building interactive web applications. I love combining my creativity with technical skills.",
    programming_languages: "JavaScript, CSS"
  },
  {
    email: "chris@hemsworth.com",
    password: "securepassword3",
    password_confirmation: "securepassword3",
    first_name: "Chris",
    last_name: "Hemsworth",
    username: "chrishemsworth",
    avatar: "https://group.hugoboss.com/fileadmin/_processed_/7/1/csm_hugo-boss_CH_Image_6a37efd63e.jpg",
    experience_level: "Beginner",
    about_me: "I am an actor with a new passion for coding. JavaScript has been particularly fun to learn. I am looking forward to developing my skills further and creating some awesome projects.",
    programming_languages: "JavaScript, Python, C"
  },
  {
    email: "ryan@gosling.com",
    password: "securepassword5",
    password_confirmation: "securepassword5",
    first_name: "Ryan",
    last_name: "Gosling",
    username: "ryangosling",
    avatar: "https://i.pinimg.com/736x/d4/00/0a/d4000afcf14edbf5411771f6229f2fa1.jpg",
    experience_level: "Intermediate",
    about_me: "Acting is my main profession, but coding is a strong interest. JavaScript has been an exciting language to work with. I enjoy creating interactive and user-friendly web applications.",
    programming_languages: "JavaScript, Java"
  },
  {
    email: "emma@stone.com",
    password: "securepassword6",
    password_confirmation: "securepassword6",
    first_name: "Emma",
    last_name: "Stone",
    username: "emmastone",
    avatar: "https://variety.com/wp-content/uploads/2018/12/emma-stone.jpg?w=1000",
    experience_level: "Beginner",
    about_me: "I am an actress with a budding interest in technology. Learning JavaScript has been a fascinating journey. I am eager to see what I can create as I continue to learn.",
    programming_languages: "JavaScript, PHP, C#"
  },
  {
    email: "jenniferlawrence@icloud.com",
    password: "securepassword13",
    password_confirmation: "securepassword13",
    first_name: "Jennifer",
    last_name: "Lawrence",
    username: "jenniferlawrence",
    avatar: "https://img.goodfon.com/wallpaper/big/5/ac/jennifer-lawrence-devushka-vzgliad-aktrisa-portret-makiiazh.webp",
    experience_level: "Beginner",
    about_me: "Interested in the potential of coding for filmmaking. Just started learning Ruby and intrigued by its creative applications. Excited to explore more!",
    programming_languages: "Ruby, HTML, CSS, C++"
  },
  {
    email: "halleberry@yahoo.com",
    password: "securepassword14",
    password_confirmation: "securepassword14",
    first_name: "Halle",
    last_name: "Berry",
    username: "halleberry",
    avatar: "https://cdn.aarp.net/content/dam/aarp/entertainment/celebrities/2022/02/1140-halle-berry-promo.jpg",
    experience_level: "Beginner",
    about_me: "Taking the first steps into web development with Ruby and JavaScript. Finding the process of building interactive websites fascinating. Can't wait to learn more!",
    programming_languages: "Ruby, JavaScript, SQL"
  },
  {
    email: "idriselba@hotmail.com",
    password: "securepassword15",
    password_confirmation: "securepassword15",
    first_name: "Idris",
    last_name: "Elba",
    username: "idriselba",
    avatar: "https://variety.com/wp-content/uploads/2020/07/idris-elba-1.jpg",
    experience_level: "Beginner",
    about_me: "Curious about the power of data analysis. Beginning my coding journey with Python and Ruby to explore data manipulation and visualization. Looking forward to the challenges!",
    programming_languages: "Python, Ruby, Rails, SQL"
  },
  {
    email: "cardi@gmail.com",
    password: "securepassword16",
    password_confirmation: "securepassword16",
    first_name: "Cardi",
    last_name: "B",
    username: "iamcardib",
    avatar: "https://lifestyle.si.com/.image/t_share/MjAyODYxOTY3Mzc3OTY2MDky/cardib.jpg",
    experience_level: "Beginner",
    about_me: "Building a website for my fans! Learning the basics of Ruby and HTML to create a user-friendly and interactive platform. It's been a fun and rewarding experience!",
    programming_languages: "PHP, HTML, Ruby"
  },
  {
    email: "chloegracemoretz@aol.com",
    password: "securepassword17",
    password_confirmation: "securepassword17",
    first_name: "Chloe",
    last_name: "Grace Moretz",
    username: "chloemoretz",
    avatar: "https://assets.teenvogue.com/photos/559c3798950ffe746eb3ac98/4:3/w_2000,h_1500,c_limit/GettyImages-465839400.jpg",
    experience_level: "Beginner",
    about_me: "Exploring the world of coding for fun.  Currently playing around with Ruby and intrigued by its problem-solving aspects. Looking forward to expanding my skills!",
    programming_languages: "Ruby, Python, NodeJS"
  },
  {
    email: "vivienne@vivienne.com",
    password: "password123",
    password_confirmation: "password123",
    first_name: "Vivienne",
    last_name: "Westwood",
    username: "#punk",
    avatar: "http://en.ozonweb.com/wp-content/uploads/2013/06/vivienne-westwood-0021.jpg",
    experience_level: "Beginner",
    about_me: "Just caught the coding bug! Rocking the basics of web development with Ruby and Javascript. Can't wait to see the gnarly creations I come up with! Watch out.",
    programming_languages: "Ruby, HTML, CSS, Javascript, Rails, Stimulus"
  }
])

users = User.all

user1 = User.first
user2 = User.last
user3 = users[1]
user4 = users[2]
user5 = users[3]

puts "Creating Users, Timeslots and Bookings..."

TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 15),
  start_time: Time.new(2024, 6, 21, 10, 0, 0),
  end_time: Time.new(2024, 6, 21, 12, 0, 0),
  reserved: false
)

TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 15),
  start_time: Time.new(2024, 8, 24, 6, 0, 0),
  end_time: Time.new(2024, 8, 24, 7, 0, 0),
  reserved: false
)

TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 22),
  start_time: Time.new(2024, 7, 28, 8, 0, 0),
  end_time: Time.new(2024, 7, 28, 9, 0, 0),
  reserved: false
)

TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 29),
  start_time: Time.new(2024, 6, 23, 13, 0, 0),
  end_time: Time.new(2024, 6, 23, 14, 0, 0),
  reserved: false
)

TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 17),
  start_time: Time.new(2024, 8, 24, 20, 0, 0),
  end_time: Time.new(2024, 8, 24, 21, 0, 0),
  reserved: false
)

TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 17),
  start_time: Time.new(2024, 8, 24, 3, 0, 0),
  end_time: Time.new(2024, 8, 24, 4, 0, 0),
  reserved: false
)

TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 17),
  start_time: Time.new(2024, 8, 24, 18, 0, 0),
  end_time: Time.new(2024, 8, 24, 19, 0, 0),
  reserved: false
)

TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 24),
  start_time: Time.new(2024, 8, 24, 18, 0, 0),
  end_time: Time.new(2024, 8, 24, 19, 0, 0),
  reserved: false
)

TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 31),
  start_time: Time.new(2024, 8, 24, 10, 0, 0),
  end_time: Time.new(2024, 8, 24, 11, 0, 0),
  reserved: false
)

TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 19),
  start_time: Time.new(2024, 8, 24, 1, 0, 0),
  end_time: Time.new(2024, 8, 24, 2, 0, 0),
  reserved: false
)

TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 27),
  start_time: Time.new(2024, 8, 24, 1, 0, 0),
  end_time: Time.new(2024, 8, 24, 2, 0, 0),
  reserved: false
)

timeslot9 = TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 12),
  start_time: Time.new(2024, 8, 24, 1, 0, 0),
  end_time: Time.new(2024, 8, 24, 2, 0, 0),
  reserved: false
)

timeslot10 = TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 10),
  start_time: Time.new(2024, 8, 24, 1, 0, 0),
  end_time: Time.new(2024, 8, 24, 2, 0, 0),
  reserved: false
)

timeslot11 = TimeSlot.create!(
  user_id: user1.id,
  date: Date.new(2024, 7, 02),
  start_time: Time.new(2024, 8, 24, 1, 0, 0),
  end_time: Time.new(2024, 8, 24, 2, 0, 0),
  reserved: false
)

Booking.create!(
  note: "Meeting for Ruby Basics",
  user_id: user3.id,
  booker_id: user2.id,
  time_slot_id: timeslot9.id,
  booking_date: Date.new(2024, 7, 12),
  status: "approved"
)

Booking.create!(
  note: "Learn about AJAX Requests",
  user_id: user4.id,
  booker_id: user2.id,
  time_slot_id: timeslot10.id,
  booking_date: Date.new(2024, 7, 10),
  status: "approved"
)

Booking.create!(
  note: "Learn about AJAX Requests",
  user_id: user5.id,
  booker_id: user2.id,
  time_slot_id: timeslot11.id,
  booking_date: Date.new(2024, 7, 02),
  status: "approved"
)

# Ensure Lady Gaga and Beyonce are retrieved properly
lady_gaga = User.find_by!(email: "ladygaga@ladygaga.com")
beyonce = User.find_by!(email: "beyonce@beyonce.com")

# Create a new time slot for Beyonce
timeslot_for_booking = TimeSlot.create!(
  user_id: beyonce.id,
  date: Date.new(2024, 7, 15),
  start_time: Time.new(2024, 7, 15, 14, 0, 0), # 2 PM
  end_time: Time.new(2024, 7, 15, 15, 0, 0), # 3 PM
  reserved: true
)

# Create a new booking where Lady Gaga books a meeting with Beyonce
Booking.create!(
  note: "Discussing collaboration on web development",
  user_id: beyonce.id, # Beyonce's user_id
  booker_id: lady_gaga.id, # Lady Gaga's user_id
  time_slot_id: timeslot_for_booking.id,
  booking_date: Date.today,
  status: "open"
)

puts "All done!"
