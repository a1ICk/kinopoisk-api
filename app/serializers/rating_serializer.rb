class RatingSerializer < ActiveModel::Serializer
  attributes :kp, :imdb
  belongs_to :movie
end
