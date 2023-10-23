class UserSerializer
  include JSONAPI::Serializer

  attributes :id, :email, :generate_jwt
end
