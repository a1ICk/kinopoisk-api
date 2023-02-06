class Movie < ApplicationRecord
  has_one :rating
  has_one :team

  validates :release_date, presence: true
  validates :genre, presence: true
  validates :title, length: {minimum: 5}
  validates :description, length: {minimum: 20}

  scope :movie_scope, ->(type, search) { where(type.to_sym => search) }
  scope :rating_scope, ->(type, search) { joins(:rating).where(rating: { type.to_sym => search }) }
  scope :movie_order_scope, ->(type) { order(type.to_s) }
end
