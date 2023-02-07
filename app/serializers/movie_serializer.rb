class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :description
  has_one :rating, serializer: RatingSerializer
  has_one :team, serializer: TeamSerializer
end
