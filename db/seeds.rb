# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Currency.destroy_all
[
  [1, 'USD', '$'],
  [2, 'CAD', '$'],
  [3, 'AUD', '$'],
  [4, 'NZD', '$'],
  [5, 'INR', '₹']
].each do |currency|
  Currency.create!(
    id: currency[0],
    name: currency[1],
    code: currency[2]
  )
end

