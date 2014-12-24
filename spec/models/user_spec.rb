require 'rails_helper'

RSpec.describe User, :type => :model do
  	it "Parse of hash attributes" do 
		user = User.new
		hash = {:screen_name => 'gabrielmalakias', :number_followers => 2}
    	user.parse(hash)
		expect(user.screen_name).to eq('gabrielmalakias')
		expect(user.number_followers).to eq(2)
	end

	it "Verify a save user not existent" do
		user = User.new
		user.screen_name = 'gabrielmalakias'
		user.number_followers = 1
		user.save_or_change({:screen_name => 'gabrielmalakias', :number_followers => 1})
		expect(user.new_record?).to eq(false)
	end

	it "Verify a update user existent" do
		user = User.new
		user.screen_name = 'gabrielmalakias'
		user.number_followers = 1
		user.save_or_change({:screen_name => 'gabrielmalakias', :number_followers => 5})
		expect(user.changed?).to eq(false)
	end

	it "Verify a existent user" do
		user = User.new
		time = Time.now
		user.created_at = time
		user.screen_name = 'gabrielmalakias'
		user.save
		expect(user.not_exists?).to eq(false)
	end	

end
