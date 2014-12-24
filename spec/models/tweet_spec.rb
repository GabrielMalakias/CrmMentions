require 'rails_helper'

RSpec.describe Tweet, :type => :model do
	it "Parse of hash attributes" do 
		tweet = Tweet.new
		time = Time.now
		hash = {:retweet_count => 2, :favorite_count => 2, 
    	:text => "Go RoR", :created_at => time, :tweet_id => '465465545646'}
    	tweet.parse(hash)
		expect(tweet.retweet_count).to eq(2)
		expect(tweet.favorite_count).to eq(2)
		expect(tweet.text).to eq("Go RoR")
		expect(tweet.created_at).to eq(time)
		expect(tweet.tweet_id).to eq('465465545646')
	end

	it "Verify a existent tweet" do
		tweet = Tweet.new
		time = Time.now
		tweet.created_at = time
		tweet.text = 'test tweet'
		tweet.save
		expect(tweet.not_exists?).to eq(false)
	end	

	it "Verify a status name" do
		tweet = Tweet.new
		tweet.status = 0
		expect(tweet.status_name).to eq('Pending')
		tweet.status = 1
		expect(tweet.status_name).to eq('Verified')
	end
end
