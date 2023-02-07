class ProducerSerializer < ActiveModel::Serializer
  attributes :id, :name, :experience
  belongs_to :team
end
