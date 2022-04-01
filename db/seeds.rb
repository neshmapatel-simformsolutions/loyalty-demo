# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Delete everything in the database and add new data.
Transaction.delete_all
UserReward.delete_all
User.destroy_all
Reward.delete_all
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

15.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: "password",
    currency_id: Currency.ids.sample,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65)
  )
end

40.times do
  Transaction.create(
    quantity: rand(1..15),
    currency_id: Currency.ids.sample,
    user_id: User.ids.sample,
    product_id: Product.ids.sample
  )
end

[
  [1, 'Free Coffee Reward',   'Reward if 100 points are accumulated in a month'                ],
  [2, 'Birthday Reward',      'Reward during birthday months'                                  ],
  [3, 'Movie Tickets Reward', 'Reward if spending is >1000 within 60 days of first transaction'],
  [4, 'Cash Rebate Reward',   'Reward if 10 or more transactions that have an amount >100'     ]
].each do |reward|
  Reward.create!(
    id: reward[0],
    name: reward[1],
    description: reward[2]
  )
end