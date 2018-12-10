# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

white_house =
  Location.create(name: "The White House",
                  address_line_1: "1600 Pennsylvania Ave NW",
                  city: "Washington",
                  district: "DC",
                  post_code: "20500",
                  latitude: "38.898311",
                  longitude: "-77.036465")

udairy =
  Location.create(name: "UDairy Creamery",
                  address_line_1: "535 S College Ave",
                  city: "Newark",
                  district: "DE",
                  post_code: "19716",
                  latitude: "39.665024",
                  longitude: "-75.750730")

sears_tower_skydeck =
  Location.create(name: "Sears (Willis) Tower Skydeck",
                  address_line_1: "233 S Wacker Dr",
                  address_line_2: "99th Floor",
                  city: "Chicago",
                  district: "IL",
                  post_code: "60606",
                  latitude: "41.878881",
                  longitude: "-87.635913")

Event.create(title: "East Wing Tour",
             description: "A tour of the East Wing of the White House. Pictures may be taken.",
             start_time: DateTime.parse("2018/12/15 9:00:00 +0500"),
             end_time: DateTime.parse("2018/12/15 12:00:00 +0500"),
             location: white_house)

Event.create(title: "West Wing Tour",
             description: "A tour of the West Wing of the White House. No photography please.",
             start_time: DateTime.parse("2018/12/19 9:00:00 +0500"),
             end_time: DateTime.parse("2018/12/19 12:00:00 +0500"),
             location: white_house)

Event.create(title: "Free Ice Cream Cone Giveaway!",
             description: "Giving away free ice cream codes because why not.",
             start_time: DateTime.parse("2018/12/10 9:00:00 +0500"),
             end_time: DateTime.parse("2018/12/10 17:00:00 +0500"),
             location: udairy)

Event.create(title: "Dairy Cow Meet & Greet",
             description: "Meet and greet with the cows whose milk makes UDairy's delicious ice cream!",
             start_time: DateTime.parse("2018/12/14 9:00:00 +0500"),
             end_time: DateTime.parse("2018/12/14 17:00:00 +0500"),
             location: udairy)

Event.create(title: "Chicago Skydeck Open House",
             description: "Come and get some great views from the 99th floor of the Sears Tower!",
             start_time: DateTime.parse("2019/1/18 9:00:00 +0600"),
             end_time: DateTime.parse("2019/1/18 17:00:00 +0600"),
             location: sears_tower_skydeck)
