# frozen_string_literal: true

require 'faker'

Movie.destroy_all
Actor.destroy_all
Team.destroy_all
Rating.destroy_all
Producer.destroy_all

100.times do
  movie = Movie.create(
    release_date: Faker::Number.between(from: 1902, to: 2023),
    genre: Faker::Book.genre,
    title: Faker::Movie.title,
    description: Faker::Quote.matz
  )

  team = Team.create(
    movie: Movie.find(movie.id)
  )

  rating = Rating.create(
    kp: Faker::Number.between(from: 1, to: 10),
    imdb: Faker::Number.between(from: 1, to: 10),
    movie: Movie.find(movie.id)
  )

  5.times do
    actor = Actor.create(
      name: Faker::Name.name,
      count_of_films: Faker::Number.between(from: 1, to: 50),
      team: Team.find(team.id)
    )
  end

  2.times do
    producer = Producer.create(
      name: Faker::Name.name,
      experience: Faker::Number.between(from: 1, to: 40),
      team: Team.find(team.id)
    )
  end
end
