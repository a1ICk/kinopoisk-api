# frozen_string_literal: true

FactoryBot.define do
  factory :producer do
    name { 'Danila Alckevich' }
    experience { 3 }
    team_id { team.id }
  end
end
