require "rails_helper"

RSpec.describe Services::TwitterClient, :type => :model do
  it "Creation of Twitter::REST::Client" do
  	expect(Services::TwitterClient.create!).to be_a_kind_of(Twitter::REST::Client)
  end
end