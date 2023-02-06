# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :movie

  validates :kp, presence: true
  validates :imdb, presence: true
end
