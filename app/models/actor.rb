class Actor < ApplicationRecord
  belongs_to :team
  validates :name, presence: true
  validates :count_of_films, length: {in: 1..50}
end
