require "rails_helper"

RSpec.describe Services::TwitterUpdater, :type => :model do
  
  it "Add a tweet" do
  	client = Services::TwitterClient.create!
  	object = client.search("to:locaweb exclude:retweets", result_type: 'mixed').collect.take(1)
  	
  	ActiveRecord::Base.transaction do
  		expect(Services::TwitterUpdater.new.add_tweet(object[0])).to eq(true)
  		ActiveRecord::Rollback
  	end
  end

   it "Add a user" do
  	client = Services::TwitterClient.create!
  	object = client.search("to:locaweb exclude:retweets", result_type: 'mixed').collect.take(1)
  	
  	ActiveRecord::Base.transaction do
  		expect(Services::TwitterUpdater.new.add_user(object[0])).to eq(true)
  		ActiveRecord::Rollback
  	end
  end

end