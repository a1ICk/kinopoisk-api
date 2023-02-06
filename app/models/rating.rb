# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :movie
  validates_numericality_of :kp, greater_than_or_equal_to: 1, less_than_or_equal_to: 10
  validates_numericality_of :imdb, greater_than_or_equal_to: 1, less_than_or_equal_to: 10
end
