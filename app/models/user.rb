class User < ActiveRecord::Base
	paginates_per 10
	has_many :tweets, dependent: :destroy

	def parse(hash)
		self.assign_attributes(hash)
	end

	def self.tweet_to_hash(object)
		{:number_followers => object.followers_count, :screen_name => object.screen_name}
	end

	def not_exists?
		User.find_by_screen_name(self.screen_name).blank?
	end
end
