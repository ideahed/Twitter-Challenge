class TweetWorker
  include Sidekiq::Worker

  def perform(tweet_id)
    tweet = Tweet.find(tweet_id)
    user  = tweet.user

    # set up Twitter OAuth client here
    # actually make API call
    # Note: this does not have access to controller/view helpers
    # You'll have to re-initialize everything inside here
    client = Twitter::Client.new(
      oauth_token: user.oauth_token,
      oauth_tokensecret: user.oauth_secret)

    client.update(tweet.status)
  end
end

# class TweetWorker
#   include Sidekiq::Worker

#   def perform(tweet_id)
#     tweet = Tweet.find(tweet_id)
#     user  = tweet.user

#     def oauth_consumer
#       raise RuntimeError, "You must set TWITTER_KEY and TWITTER_SECRET in your server environment." unless ENV['TWITTER_KEY'] and ENV['TWITTER_SECRET']
#       @consumer ||= OAuth::Consumer.new(
#         ENV['TWITTER_KEY'],
#         ENV['TWITTER_SECRET'],
#         :site => "https://api.twitter.com"
#         )
#     end

#     def request_token
#       if not session[:request_token]
#     # this 'host_and_port' logic allows our app to work both locally and on Heroku
#     host_and_port = request.host
#     host_and_port << ":9393" if request.host == "localhost"

#     # the `oauth_consumer` method is defined above
#     session[:request_token] = oauth_consumer.get_request_token(
#       :oauth_callback => "http://#{host_and_port}/auth"
#       )
#   end
#   session[:request_token]
# end
# end
