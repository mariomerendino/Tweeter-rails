class TweetsController < ApplicationController
  def index
    render json: { tweets: Timeline.new(current_user).execute }
  end
end
