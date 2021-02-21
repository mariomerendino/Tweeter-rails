class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :tweets
  has_many :follows

  # returns a list of all the users followers
  def followers
    follower_ids = Follow.where(following_id: id).pluck(:user_id)
    User.where(id: follower_ids)
  end

  # returns a list of all the users this user is following
  def following
    # collect all the users ids that this user is following
    following_ids = follows.pluck(:following_id)
    User.where(id: following_ids)
  end
end
