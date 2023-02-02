# frozen_string_literal: true

FactoryBot.define do
  factory :actor do
    name { 'clown' }
    count_of_films { 2 }
    team_id { team.id }
  end
end
