class Team < ApplicationRecord
  belongs_to :movie
  has_many :producer
  has_many :actor
end
