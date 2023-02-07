# frozen_string_literal: true

FactoryBot.define do
  factory :movie, class: 'Movie' do
    release_date { Faker::Number.between(from: 1900, to: 2023) }
    title { Faker::Movie.title }
    genre { Faker::Book.genre }
    description { Faker::Quote.matz }
  end
end
