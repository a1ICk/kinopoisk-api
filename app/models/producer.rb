# frozen_string_literal: true

class Producer < ApplicationRecord
  belongs_to :team
  validates :name, presence: true
  validates_numericality_of :experience, greater_than_or_equal_to: 1, less_than_or_equal_to: 40
end
