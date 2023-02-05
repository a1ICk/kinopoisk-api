# frozen_string_literal: true

class Producer < ApplicationRecord
  belongs_to :team
  validates :name, presence: true
  validates :experience, length: {in: 1..40}
end
