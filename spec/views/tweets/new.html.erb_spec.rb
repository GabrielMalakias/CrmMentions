require 'rails_helper'

RSpec.describe "tweets/new", :type => :view do
  before(:each) do
    assign(:tweet, Tweet.new(
      :retweets => 1,
      :favorited => 1,
      :content => "MyString"
    ))
  end

  it "renders new tweet form" do
    render

    assert_select "form[action=?][method=?]", tweets_path, "post" do

      assert_select "input#tweet_retweets[name=?]", "tweet[retweets]"

      assert_select "input#tweet_favorited[name=?]", "tweet[favorited]"

      assert_select "input#tweet_content[name=?]", "tweet[content]"
    end
  end
end
