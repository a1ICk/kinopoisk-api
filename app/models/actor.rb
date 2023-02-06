class Actor < ApplicationRecord
  belongs_to :team
  validates :name, presence: true
  validates_numericality_of :count_of_films, greater_than_or_equal_to: 1, less_than_or_equal_to: 50
end
