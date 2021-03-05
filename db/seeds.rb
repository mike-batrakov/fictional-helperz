# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning DB ..."
User.destroy_all
Listing.destroy_all
Review.destroy_all

puts "Creating users ..."

mary = User.create!(
  email: "mary@test.com",
  password: "123456"
)
puts 'User for Mary was created'

tep = User.create!(
  email: "tep@test.com",
  password: "123456"
)
puts 'User for Tep was created'

nazim = User.create!(
  email: "nazim@test.com",
  password: "123456"
)
puts 'User for Nazim was created'

michael = User.create!(
    email: "michael@test.com",
    password: "123456"
  )
puts 'User for Michael was created'

puts 'Creating listings ...'

mary_listing = Listing.create!(
  name: "Mary's listing",
  description: "Testing Mary's listing description",
  user_id: mary.id 
)
puts 'Listing for Mary was created'

tep_listing = Listing.create!(
  name: "Tep's listing",
  description: "Testing Tep's listing description",
  user_id: tep.id 
)
puts 'Listing for Tep was created'

nazim_listing = Listing.create!(
  name: "Nazim's listing",
  description: "Testing Nazim's listing description",
  user_id: nazim.id 
)
puts 'Listing for Nazim was created'

michael_listing = Listing.create!(
  name: "Michael's listing",
  description: "Testing Michael's listing description",
  user_id: michael.id 
)
puts 'Listing for Nazim was created'

puts 'Creating bookings ...'

booking_one = Booking.create!(
  user_id: mary.id,
  listing_id: tep_listing.id,
  status: true
)

booking_two = Booking.create!(
  user_id: tep.id,
  listing_id: mary_listing.id,
  status: true
)

booking_three = Booking.create!(
  user_id: nazim.id,
  listing_id: michael_listing.id,
  status: true
)

booking_four = Booking.create!(
  user_id: michael.id,
  listing_id: nazim_listing.id,
  status: true
)

puts 'Seeds completed'