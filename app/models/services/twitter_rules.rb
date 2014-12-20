module Services
	
	class TwitterRules
		
		attr_accessor :client
		
		def initialize
			@client = Services::TwitterClient.create!
		end

		def tweets_mention_by_user(twitter_user)
			client.search("to:#{twitter_user}", result_type: "recent").collect do |tweet|
  				"#{tweet.user.screen_name}: #{tweet.text}"
			end
		end
	end

end