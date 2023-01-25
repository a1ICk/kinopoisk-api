class Movie < ApplicationRecord
  has_one :rating
  has_one :team
end
