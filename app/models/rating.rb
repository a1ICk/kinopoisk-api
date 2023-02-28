# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :movie

  validates_numericality_of :kp, greater_than_or_equal_to: 1, less_than_or_equal_to: 10
  validates_numericality_of :imdb, greater_than_or_equal_to: 1, less_than_or_equal_to: 10
  validates :kp, presence: true
  validates :imdb, presence: true

  scope :rating_scope, ->(type, search) { where(type.to_sym => search) }
  scope :good_rating_scope, ->(start = 8) { where('kp >= :start AND imdb >= :start', start: start) }
  scope :normal_rating_scope, ->(start = 4, stop = 8) { where(kp: (start..stop)).and(where(imdb: (start..stop))) }
  scope :bad_rating_scope, ->(stop = 4) { where('kp <= :stop AND imdb <= :stop', stop: stop) }
  scope :rating_order_scope, ->(type) { order(type.to_s) }
  scope :multi_value_rating_scope, ->(type, search) { where(type.to_sym => search) }
end
