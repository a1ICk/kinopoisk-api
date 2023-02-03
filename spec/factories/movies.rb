# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    release_date { 2008 }
    genre { 'action' }
    title { 'Thor' }
    description { 'Top one' }
  end
end
