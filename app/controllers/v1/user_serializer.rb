# app/serializers/v1/user_serializer.rb
module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :created_at, :updated_at
  end
end