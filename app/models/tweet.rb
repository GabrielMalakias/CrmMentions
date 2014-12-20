class Tweet < ActiveRecord::Base

   	belongs_to :user

    def parse(hash)
    	self.assign_attributes(hash)
    end

    def not_exists?
    	Tweet.find_by_created_at_and_text(self.created_at, self.text).blank?
    end

    def self.tweet_to_hash(object)
    	{:retweet_count => object.retweet_count, :favorite_count => object.retweet_count, 
    		:text => object.text, :created_at => object.created_at}
    end
end
