class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes

  validates_presence_of :user_id
  validates_presence_of :text

  def number_of_likes
    likes.count
  end

  def liked_by
    User.where(id: likes.pluck(:user_id))
  end
end
