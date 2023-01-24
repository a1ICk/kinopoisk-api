# frozen_string_literal: true

Movie.destroy_all

100.times do
  Movie.create(
    release_date:Faker::Number.between(from: 1902, to: 2023),
    genre:Faker::Book.genre,
    title:Faker::Movie.title,
    description:Faker::Movie.quote
  )
end
