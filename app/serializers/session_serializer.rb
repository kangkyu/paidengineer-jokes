class SessionSerializer < ActiveModel::Serializer
  attributes :id, :token, :created_at, :updated_at, :user_id
end
