# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    movie_id { Movie.first }
  end
end
