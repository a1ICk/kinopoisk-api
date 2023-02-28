class Actor < ApplicationRecord
  belongs_to :team

  validates :name, presence: true
  validates_numericality_of :count_of_films, greater_than_or_equal_to: 1, less_than_or_equal_to: 50
  validates :count_of_films, presence: true

  scope :actor_scope, ->(type, search) { where(type.to_sym => search) }
  scope :popular_actor_scope, ->(start = 32) { where('count_of_films >= ?', start) }
  scope :normal_actor_scope, ->(start = 5, stop = 32) { where(count_of_films: (start..stop)) }
  scope :unpopular_actor_scope, ->(stop = 5) { where('count_of_films <= ?', stop) }
  scope :actor_order_scope, ->(type) { order(type.to_s) }
  scope :multi_value_actor_scope, ->(type, search) { where(type.to_sym => search) }
end
