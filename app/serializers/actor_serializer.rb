class ActorSerializer < ActiveModel::Serializer
  attributes :id, :name, :count_of_films
  belongs_to :team
end
