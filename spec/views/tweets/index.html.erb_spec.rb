require 'rails_helper'

RSpec.describe "tweets/index", :type => :view do
  before(:each) do
    assign(:tweets, [
      Tweet.create!(
        :retweets => 1,
        :favorited => 2,
        :content => "Content"
      ),
      Tweet.create!(
        :retweets => 1,
        :favorited => 2,
        :content => "Content"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
