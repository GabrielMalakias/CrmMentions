class Tweet < ActiveRecord::Base
	paginates_per 5
   	belongs_to :user
    default_scope {includes(:user).order('users.number_followers DESC')} 
    def parse(hash)
    	self.assign_attributes(hash)
    end

    def not_exists?
    	Tweet.find_by_created_at_and_text(self.created_at, self.text).blank?
    end

    def self.tweet_to_hash(object)
    	{:retweet_count => object.retweet_count, :favorite_count => object.retweet_count, 
    	:text => object.text, :created_at => object.created_at, :tweet_id => object.id}
    end

    def status_name
    	status.blank? || status == 0 ? 'Pending' : 'Verified'
    end

end
