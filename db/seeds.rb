# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@bachelorette1 = Bachelorette.create!(name: "Hannah Brown",
                                      season_number: 15, description: "Absolutely wild!!")

@peter = @bachelorette1.contestants.create!(name: "Pilot pete", age: 28, hometown: "Los Angeles")
@gregg = @bachelorette1.contestants.create!(name: "Old Gregg", age: 39, hometown: "Over there")
