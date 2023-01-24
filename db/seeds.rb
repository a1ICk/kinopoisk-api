# frozen_string_literal: true

require 'faker'

puts "Sup"
Movie.destroy_all
Actor.destroy_all

10.times do 
  Movie.create(
    release_date:Faker::Number.between(from: 1902, to: 2023),
    genre:Faker::Book.genre,
    title:Faker::Movie.title,
    description:Faker::Movie.quote
  )

  5.times do
    actor = Actor.create(
    name:  Faker::Name.name,
    count_of_films: Faker::Number.between(from: 1, to: 50)
  )
  end
end
