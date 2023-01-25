class Movie < ApplicationRecord
  has_one :rating
  has_one :team

  scope :kp, -> (parameter) { where("id != #{parameter}") }
end
