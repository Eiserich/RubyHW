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
                   category_id: 1
                 },
                 {
                   name: 'Chelsea',
                   description: "Comfortable Chelsea men's t-shirt",
                   price: 35,
                   category_id: 1
                 },
                 {
                   name: 'Roma',
                   description: 'Roma t-shirt, one of the most popular football club in Italy',
                   price: 25,
                   category_id: 2
                 },
                 {
                   name: 'Inter',
                   description: 'T-shirt of legendary football club Inter',
                   price: 30,
                   category_id: 2
                 },
                 {
                   name: 'Bayern',
                   description: "Exclusive  Bayern men's t-shirt",
                   price: 35,
                   category_id: 3
                 },
                 {
                   name: 'Dortmund',
                   description: "Comfortable Borussia Dortmund men's t-shirt",
                   price: 35,
                   category_id: 3
                 }
               ])

User.create!(email: 'user@ukr.com', password: 'password', password_confirmation: 'password')
if Rails.env.development?
  AdminUser.create!(email: 'admin@ukr.com', password: 'password', password_confirmation: 'password')
end
