class User < ActiveRecord::Base
	paginates_per 10
	has_many :tweets, dependent: :destroy
	default_scope {order('users.number_followers DESC')} 
	
	def parse(hash)
		self.assign_attributes(hash)
	end

	def save_or_change(hash_user)
		if self.not_exists? 
			self.save 
		else 
			user = User.find_by_screen_name(hash_user[:screen_name])
			user.update(:number_followers => hash_user[:number_followers])
		end
	end

	def self.tweet_to_hash(object)
		{:number_followers => object.followers_count, :screen_name => object.screen_name}
	end

	def not_exists?
		User.find_by_screen_name(self.screen_name).blank?
	end
end
