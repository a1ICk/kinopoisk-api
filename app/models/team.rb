class Team < ApplicationRecord
  belongs_to :movie
  has_many :producer
end
