# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :movie
  validates :kp, length: {in: 1..10}
  validates :imdb, length: {in: 1..10}
end
