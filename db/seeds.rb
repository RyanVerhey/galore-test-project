# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# The White House
Location.create(address_line_1: "1600 Pennsylvania Ave NW",
                city: "Washington",
                district: "DC",
                post_code: "20500",
                latitude: "38.898311",
                longitude: "-77.036465")

# UDairy Creamery
Location.create(address_line_1: "535 S College Ave",
                city: "Newark",
                district: "DE",
                post_code: "19716",
                latitude: "39.665024",
                longitude: "-75.750730")
