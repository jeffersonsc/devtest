class Occurrence < ActiveRecord::Base
  belongs_to :twitter_user

  validates_presence_of :tweet_id, :content, :tweet_created_at
end
