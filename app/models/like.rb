# A record to show what users like what tweet.
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
end
