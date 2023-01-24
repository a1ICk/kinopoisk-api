# frozen_string_literal: true

require 'faker'

puts "Sup"
Actor.destroy_all

10.times do 

  5.times do
    actor = Actor.create(
    name:  Faker::Name.name,
    count_of_films: Faker::Number.between(from: 1, to: 50)
  )
  end
end
