module Services

	class TwitterUpdater
		TWITTER_USER = 'locaweb'
		RESULT_TYPE = 'recent'

		attr_accessor :client
		
		def initialize
			@client = Services::TwitterClient.create!
		end

		def tweets_mention_by_user(twitter_user=TWITTER_USER, result_type=RESULT_TYPE)
			client.search("to:#{twitter_user} exclude:retweets", result_type: result_type).collect do |tweet|
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

		def update!(result_type)
			tweets_mention_by_user('locaweb', result_type)
		end

		def self.result_type_options
			['mixed', 'popular', 'recent']
		end

	end

end