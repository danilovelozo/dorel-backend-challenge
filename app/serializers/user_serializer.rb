# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer

  attributes :id, :email, :generate_jwt
end
