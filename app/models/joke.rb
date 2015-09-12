class Joke < ActiveRecord::Base
  has_many :tags
  validates :body, presence: true
end
