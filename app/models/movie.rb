class Movie < ApplicationRecord
  has_one :rating
  has_one :team

  validates :release_date, presence: true
  validates :genre, presence: true
  validates :title, length: { in: 1..1000 }
  validates :description, length: { minimum: 50 }

  scope :movie_scope, ->(type, search) { where(type.to_sym => search) }
  scope :rating_scope, ->(type, search) { joins(:rating).where(rating: { type.to_sym => search }) }
  scope :movie_order_scope, ->(type) { order(type.to_s) }
  scope :multi_value_movie_scope, ->(type, search) { where(type.to_sym => search) }
end
