class JokeSerializer < ActiveModel::Serializer
  attributes :id, :body
  has_many :tags
end

