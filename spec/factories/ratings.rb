# frozen_string_literal: true

FactoryBot.define do
  factory :rating, class: 'Rating' do
    kp { Faker::Number.between(from: 1, to: 10) }
    imdb { Faker::Number.between(from: 1, to: 10) }
    movie_id { Movie.first }
  end
end
