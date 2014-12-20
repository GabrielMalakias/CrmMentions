require 'rails_helper'

RSpec.describe "tweets/index", :type => :view do
  before(:each) do
    assign(:tweets, [
      Tweet.create!(
        :retweet_count => 1,
        :favorite_count => 2,
        :text => "Text"
      ),
      Tweet.create!(
        :retweet_count => 1,
        :favorite_count => 2,
        :text => "Text"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
