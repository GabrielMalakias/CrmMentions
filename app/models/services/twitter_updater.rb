module Services

	class TwitterUpdater
		TWITTER_USER = TWITTER_CONFIG['user']
		RESULT_TYPE = 'recent'

		attr_accessor :client, :user
		
		def initialize
			@client = Services::TwitterClient.create!
		end

		def tweets_mention_by_user(twitter_user=TWITTER_USER, result_type=RESULT_TYPE)
			client.search("to:#{twitter_user} exclude:retweets", result_type: result_type).collect do |tweet|
				add_tweet_in_database(tweet)
			end
		end

		def add_tweet_in_database(object)
			add_user(object)
			add_tweet(object)
		end
		
		def add_tweet(object)
			tweet = Tweet.new
			tweet.parse(Tweet.tweet_to_hash(object))
			tweet.user = @user
			tweet.save if tweet.not_exists?
		end
		
		def add_user(object)
			@user = User.new
			hash_user = User.tweet_to_hash(object.user)
			@user.parse(hash_user)
			@user.save_or_change(hash_user)
		end

		def update!(result_type)
			tweets_mention_by_user(TWITTER_USER, result_type)
		end

		def self.result_type_options
			['mixed', 'popular', 'recent']
		end

	end

end