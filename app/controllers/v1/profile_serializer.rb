# app/serializers/v1/profiles_serializer.rb
module V1
  class ProfileSerializer < ActiveModel::Serializer
    attributes :id, :nickName, :user_id, :created_at, :updated_at
  end
end