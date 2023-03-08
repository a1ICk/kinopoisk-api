class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :role
end
