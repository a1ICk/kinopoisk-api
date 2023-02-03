class Actor < ApplicationRecord
  belongs_to :team

  validates :name, presence: true
  validates :count_of_films, presence: true
end
