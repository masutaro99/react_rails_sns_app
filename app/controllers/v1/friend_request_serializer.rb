module V1
  class FriendRequestSerializer < ActiveModel::Serializer
    attributes :id, :askFrom_id, :askTo_id, :approved, :created_at, :updated_at
  end
end