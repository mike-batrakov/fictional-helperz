# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
file = URI.open('https://cdn.mos.cms.futurecdn.net/jkL25z4c7croemhkBRG8Pb.jpg')
file1 = URI.open('https://c4.wallpaperflare.com/wallpaper/61/696/907/south-park-eric-cartman-kyle-broflovski-wallpaper-preview.jpg')
file2 = URI.open('https://i.pinimg.com/originals/ab/04/44/ab0444a0c3307f864e89c58f712c7110.jpg')
file3 = URI.open('https://images.hdqwalls.com/download/batman-4k2020-9y-1680x1050.jpg')
file4 = URI.open('https://media.distractify.com/brand-img/VxbP7JofG/480x252/ehul9_duyaab1na-1614901892050.jpg')
file5 = URI.open('https://i.kym-cdn.com/entries/icons/original/000/031/081/coomer.png')
file6 = URI.open('https://i.pinimg.com/originals/be/10/ca/be10cae71fd1d958ca57b0af212c5160.jpg')
file7 = URI.open('https://free4kwallpapers.com/uploads/originals/2015/12/19/voldemort-in-hp7-part-2-wallpaper.jpg')


puts "Cleaning DB ..."
Booking.destroy_all
Listing.destroy_all
User.destroy_all

puts "Creating users ..."

mary = User.create!(
  username: "Stormtrooper",
  email: "mary@test.com",
  password: "123456"
)
puts 'User for Mary was created'

tep = User.create!(
  username: "Daffy Duck",
  email: "tep@test.com",
  password: "123456"
)
puts 'User for Tep was created'

nazim = User.create!(
  username: "Spider-man",
  email: "nazim@test.com",
  password: "123456"
)
puts 'User for Nazim was created'

michael = User.create!(
    username: "Michael Scott",
    email: "michael@test.com",
    password: "123456"
  )
puts 'User for Michael was created'

puts 'Creating listings ...'

mary_listing = Listing.create!(
  name: "Spiderman's Babysitting services",
  description: "When I'm not fightin' crime, or with sweet sweet Mary-Jane, I can essentially offer my babysitting services.",
  price: 100,
  user_id: mary.id
)

mary_listing.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')

puts 'Listing for Mary was created'

michael_listing = Listing.create!(
  name: "Eric Cartman's Roasting Service",
  description: "If you want to feel diminished and constantly insulted, I'll be att your service.",
  user_id: michael.id
)

michael_listing.photo.attach(io: file1, filename: 'nes1.png', content_type: 'image/jpg')

puts 'Listing for Michael 2 was created'

nazim_listing = Listing.create!(
  name: "Shrek's Swamp",
  description: "Get out of it. It's MA SWAMP",
  user_id: nazim.id
)

nazim_listing.photo.attach(io: file2, filename: 'nes2.png', content_type: 'image/jpg')

puts 'Listing for Nazim 1 was created'

tep_listing = Listing.create!(
  name: "Batman, the bodyguard",
  description: "When I'm not preoccupied with the Bat-family's drama, I can offer my services as a bouncer. I have experience.",
  user_id: tep.id
)

tep_listing.photo.attach(io: file3, filename: 'nes3.png', content_type: 'image/jpg')

puts 'Listing for Tep was created'

nazim_listing = Listing.create!(
  name: "Lola Bunny's Cooking Skills",
  description: "M'yeh.. Wassup, doc?",
  price: 100,
  user_id: nazim.id
)

nazim_listing.photo.attach(io: file4, filename: 'nes4.png', content_type: 'image/jpg')

puts 'Listing for Nazim 2 was created'

michael_listing = Listing.create!(
  name: "Wojak's Therapy Help",
  description: "I am alone. You're alone. Let's both be alone, together and share depressive thoughts.",
  user_id: michael.id
)

michael_listing.photo.attach(io: file5, filename: 'nes5.png', content_type: 'image/jpg')

puts 'Listing for Mary 2 was created'

mary_listing = Listing.create!(
  name: "Patrick Bateman's Axe Sharpening Skill",
  description: "Have you heard of Huey Lewis and the News? I'd like to offer you, my skills in axe sharpening.",
  user_id: mary.id
)

mary_listing.photo.attach(io: file6, filename: 'nes6.png', content_type: 'image/jpg')

puts 'Listing for Mary 2 was created'

tep_listing = Listing.create!(
  name: "Voldemort's Personal Kidsitting",
  description: "H....A....R....R....Y POT-TAH... I'll chill wid ur kids n stuf hehehe",
  user_id: tep.id
)

tep_listing.photo.attach(io: file7, filename: 'nes7.png', content_type: 'image/jpg')

puts 'Listing for Tep2 was created'

puts 'Creating bookings ...'

booking_one = Booking.create!(
  user_id: mary.id,
  listing_id: tep_listing.id,
  status: true,
  start_date: "May 1st 2021",
  end_date: "January 31st 2022"
)

booking_two = Booking.create!(
  user_id: tep.id,
  listing_id: mary_listing.id,
  status: true,
  start_date: "May 1st 2021",
  end_date: "January 31st 2022"
)

booking_three = Booking.create!(
  user_id: nazim.id,
  listing_id: michael_listing.id,
  status: true,
  start_date: "May 1st 2021",
  end_date: "January 31st 2022"
)

booking_four = Booking.create!(
  user_id: michael.id,
  listing_id: nazim_listing.id,
  status: true,
  start_date: "May 1st 2021",
  end_date: "January 31st 2022"
)

puts 'Seeds completed'
