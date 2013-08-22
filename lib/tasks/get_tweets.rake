task get_tweets: :environment do
  TweetStream.configure do |config|
    config.consumer_key       = ENV['CONSUMER_KEY']
    config.consumer_secret    = ENV['CONSUMER_SECRET']
    config.oauth_token        = ENV['ACCESS_TOKEN']
    config.oauth_token_secret = ENV['ACCESS_SECRET']
    config.auth_method        = :oauth
  end

  TweetStream::Client.new.sample do |status|
    # TWEET
    puts "#{status.text}"
    Tweet.create(tweet_object: status.attrs)
  end
end