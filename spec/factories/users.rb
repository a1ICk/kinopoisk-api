# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    role { 0 }
  end
end
