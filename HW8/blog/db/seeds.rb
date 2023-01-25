# frozen_string_literal: true

require 'faker'

5.times do
  Author.create(
    name: Faker::Name.name
  )
end

10.times do
  title = Faker::Hipster.word
  Tag.create title: title
end

Article.create(title: 'First article', body: 'Text for article')
Article.create(title: 'Second article', body: 'Text for article')
Article.create(title: 'Third article', body: 'Text for article')
