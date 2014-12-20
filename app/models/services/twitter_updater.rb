module Services

	class TwitterUpdater
		TWITTER_USER = 'locaweb'
		attr_accessor :client
		
		def initialize
			@client = Services::TwitterClient.create!
		end

		def tweets_mention_by_user(twitter_user=TWITTER_USER)
			client.search("to:#{twitter_user}", result_type: "recent").collect do |tweet|
				add_tweet_in_database(tweet)
			end
		end

		def add_tweet_in_database(object)
			user = User.new
			tweet = Tweet.new
			user.parse(User.tweet_to_hash(object.user))
			tweet.parse(Tweet.tweet_to_hash(object))
			user.save if user.not_exists?
			tweet.user = user
			tweet.save if tweet.not_exists?
		end

	end

end