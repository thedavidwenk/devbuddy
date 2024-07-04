# DevBuddy

DevBuddy is a platform designed for junior software engineers seeking to connect with fellow developers to find an accountability buddy. Our motto is: ‘We don’t make it easier to become a software developer, but you don’t have to be alone while becoming one.’

This platform is the final project of Le Wagon Web Development Bootcamp batch #1576.

## Table of Contents

- [Features](#features)
- [Technologies](#technologies)
- [Setup](#setup)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features

- User Authentication
- Onboarding
- Find and filter a buddy based on skill level and programming language 
- Visit a buddy profile
- Add a buddy to your favorite list
- Select and Book a meeting with a buddy
- In app notifications about upcoming bookings
- Create and delete your own availabilities with time slots 
- Approve incoming meeting requests 
- See upcoming and past meetings 


## Technologies

- Ruby on Rails 7.1
- PostgreSQL as Database
- Devise for user authentication
- Bootstrap 5.2 for styling
- Font Awesome for icons
- Simple Form for forms
- pg_search: Adds full-text search capabilities using PostgreSQL
- Flatpickr as datetime picker
- Stimulus JS for JS
- Cloudinary: Cloud-based image and video management
- Dotenv-Rails: Load environment variables from .env file
- Acts As Favoritor gem: Add favoriting functionality


## Setup

1. Clone Repository 

```sh
git clone https://github.com/clarroquia/devbuddy.git
```

2. Navigate to the project directory

```sh
cd devbuddy
```

3. Install dependencies

```sh
bundle install
```

4. Setup the database

```sh
rails db:create
rails db:migrate
rails db:seed
```

5. Start the Rails server

```sh
rails server
```

Configuration

  Make sure to configure your database settings in config/database.yml.
  Create an account with Cloudinary
  Create an .env file to store environment variables.


Usage

  Navigate to http://localhost:3000 in your browser.
  Register or log in to access the main features.

## License

This project is licensed under the MIT License. See `LICENSE` for more information.

### Modification and Redistribution Disclaimer

Permission is hereby denied to modify, adapt, or redistribute copies of this software or its derivative works for any purpose, including commercial, subject to the following conditions:

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT, OR OTHERWISE, ARISING FROM, OUT OF, OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
