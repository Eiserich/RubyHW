# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.create([
                  {
                    title: 'EPL'
                  },
                  {
                    title: 'Serie A'
                  },
                  {
                    title: 'Bundesliga'
                  }

                ])

Product.create([
                 {
                   name: 'Arsenal',
                   description: 'Exclusive Arsenal men’s t-shirts, one of the best english teams in this season.',
                   price: 30,
                   image: 'https://pro-football.com.ua/content/images/41/390x390l80mc0/77403063720940.webp',
                   category_id: 1
                 },
                 {
                   name: 'Chelsea',
                   description: "Comfortable Chelsea men's t-shirt",
                   price: 35,
                   image: 'https://pro-football.com.ua/content/images/48/240x240l85nn0/21509896188829.webp',
                   category_id: 1
                 },
                 {
                   name: 'Roma',
                   description: 'Roma t-shirt, one of the most popular football club in Italy',
                   price: 25,
                   image: 'https://pro-football.com.ua/content/images/44/240x240l85nn0/32443435787441.webp',
                   category_id: 2
                 },
                 {
                   name: 'Inter',
                   description: 'T-shirt of legendary football club Inter',
                   price: 30,
                   image: 'https://pro-football.com.ua/content/images/10/240x240l85nn0/66385519124511.webp',
                   category_id: 2
                 },
                 {
                   name: 'Bayern',
                   description: "Exclusive  Bayern men's t-shirt",
                   price: 35,
                   image: 'https://pro-football.com.ua/content/images/10/240x240l85nn0/50067543661104.webp',
                   category_id: 3
                 },
                 {
                   name: 'Dortmund',
                   description: "Comfortable Borussia Dortmund men's t-shirt",
                   price: 35,
                   image: 'https://pro-football.com.ua/content/images/10/240x240l85nn0/82939259191099.webp',
                   category_id: 3
                 }
               ])

User.create!(email: 'user@ukr.com', password: 'password', password_confirmation: 'password')
if Rails.env.development?
  AdminUser.create!(email: 'admin@ukr.com', password: 'password', password_confirmation: 'password')
end
