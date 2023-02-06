# frozen_string_literal: true

FactoryBot.define do
  factory :producer, class: 'Producer' do
    name { Faker::Name.name }
    experience { Faker::Number.between(from: 1, to: 40) }
    team_id { Team.first }
  end
end
