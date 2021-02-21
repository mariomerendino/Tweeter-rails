class Timeline
  attr_reader :user

  def initialize(user)
    @user = user
  end

  # returns a list of tweets for a users timeline.
  def execute
    tweets_object
  end

  private

  def users_to_get_tweets_from
    user.following
  end

  # returns an ordered list of tweets with their user ids
  # [{
  #   tweet_text: ""
  #   username: ""
  #   created_at: timestamp
  # }]
  def tweets_object
    tweets = Tweet.joins(:user).where(user_id: users_to_get_tweets_from.pluck(:id)).order(:created_at)
    tweets.each_with_object([]) do |tweet, object|
      object << {
        tweet_text: tweet.text, 
        username: tweet.user.username, 
        created_at: tweet.created_at
      }
    end
  end
end
