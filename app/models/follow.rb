# A follow record to show when a user follows another user.
# We can also user this to determine a users followers. 
class Follow < ApplicationRecord
  belongs_to :user
end
