# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Transaction.delete_all
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

Product.destroy_all
[
  [1, 'Power Bank',   '150.0',    'gadget'],
  [2, 'Type-C Cable', '85.50',    'gadget'],
  [3, 'Book',         '10.0', 'stationary'],
  [4, 'Calculator',   '50.0', 'stationary']
].each do |product|
  Product.create!(
    id: product[0],
    title: product[1],
    price: product[2],
		category: product[3]
  )
end

# 15.times do
#   Transaction.create(
#     quantity: Faker::Number.digit,
#     user_id: User.find(Faker::Number.)
#   )
# end
