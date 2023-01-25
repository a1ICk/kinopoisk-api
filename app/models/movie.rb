class Movie < ApplicationRecord
  has_one :rating
  has_one :team

  scope :movie_scope, ->(type, search) { where(type.to_sym => search) }
  scope :rating_scope, ->(type, search) { joins(:rating).where(rating: { type.to_sym => search }) }
end
