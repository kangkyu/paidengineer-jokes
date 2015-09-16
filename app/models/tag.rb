class Tag < ActiveRecord::Base
  validates :joke_id, presence: true
  validates :tag, presence: true
end

