# frozen_string_literal: true

class Producer < ApplicationRecord
  belongs_to :team

  validates :name, presence: true
  validates_numericality_of :experience, greater_than_or_equal_to: 1, less_than_or_equal_to: 40
  validates :experience, presence: true

  scope :producer_scope, ->(type, search) { where(type.to_sym => search) }
  scope :popular_producer_scope, ->(start = 40) { where('experience >= ?', start) }
  scope :normal_producer_scope, ->(start = 7, stop = 40) { where(experience: (start..stop)) }
  scope :unpopular_producer_scope, ->(stop = 7) { where('experience <= ?', stop) }
  scope :producer_order_scope, ->(type) { order(type.to_s) }
  scope :multi_value_producer_scope, ->(type, search) { where(type.to_sym => search) }
end
