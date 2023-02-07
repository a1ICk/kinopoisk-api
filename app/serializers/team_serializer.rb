class TeamSerializer < ActiveModel::Serializer
  belongs_to :movie
  has_many :producer, serializer: ProducerSerializer
  has_many :actor, serializer: ActorSerializer

  class ProducerSerializer < ActiveModel::Serializer
    attributes :id, :name, :experience
    belongs_to :team
  end
  class ActorSerializer < ActiveModel::Serializer
    attributes :id, :name, :count_of_films
    belongs_to :team
  end
end
