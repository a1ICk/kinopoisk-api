class TeamSerializer < ActiveModel::Serializer
  belongs_to :movie
  has_many :producer, serializer: ProducerSerializer
  has_many :actor, serializer: ActorSerializer
end
