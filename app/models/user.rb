class User < ActiveRecord::Base
  # Remember to create a migration!

  def tweet(status)
    tweet = tweets.create!(:status => status)
    TweetWorker.perform_async(tweet.id)
  end
  
end
