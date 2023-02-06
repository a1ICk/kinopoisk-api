# frozen_string_literal: true

FactoryBot.define do
  factory :actor, class: 'Actor' do
    name { Faker::Name.name }
    count_of_films { Faker::Number.between(from: 1, to: 50) }
    team_id { Team.first }
  end
end
